$(window).resize(function() {
  Charts.lineChartsRedraw();
});

$(function() {
  Misc.init();
  Selects.init();
  Menu.init();
  Sliders.init();
  GalleryGrid.init();
  Charts.init();

});

Misc = {
  init: function() {
    if ($('.js-autogrow').length) {
      autosize($('.js-autogrow'));
    }

    $('[data-toggle="tooltip"]').tooltip({container: 'body'});
    $('[data-toggle="popover"]').popover()
  }
}

// Custom selects initialization
Selects = {
  init: function() {
    if ($('.js-select').length) {
      $('.js-select').select2({
        minimumResultsForSearch: Infinity
      });
    }
  }
}

// Menu initialization
Menu = {
  init: function() {
    // Aside navigation toggler
    $('.js-nav-toggler').click(function(e) {
      e.preventDefault();

      if ($(this).find('.icon-menu').length) {
        $(this).find('.icon').removeClass('icon-menu').addClass('icon-close');
      } else {
        $(this).find('.icon').removeClass('icon-close').addClass('icon-menu');
      }

      // Toggle aside menu
      $('.aside').toggle('slide', 'left', 300);
      $('.pageWrap .pageContent').toggleClass('extended', 300, function() {
        if ($('.galleryGrid').length) {
          GalleryGrid.grid.shuffle('update');
        }
        Charts.lineChartsRedraw();
      });
    });

    $('.js-submenu > div').click(function(e) {
      if ($('.extendedChecker').is(':hidden')) {
        $(this).parent().toggleClass('active');
        $(this).siblings('ul').slideToggle();
      }
    });
  }
}

// Input slider initialization
Sliders = {
  init: function() {
    if ($('#slider-range-max').length) {
      $('#slider-range-max').slider({
        range: 'max',
        min: 1,
        max: 100,
        value: 69,
        slide: function(event, ui) {
          $('#amount').val(ui.value);
        }
      });
      $('#amount').val($('#slider-range-max').slider('value'));
    }

    if ($('#slider-range').length) {
      $('#slider-range').slider({
        range: true,
        min: 0,
        max: 100,
        values: [12, 58],
        slide: function(event, ui) {
          $('#amount-1').val(ui.values[0]);
          $('#amount-2').val(ui.values[1]);
        }
      });
      $('#amount-1').val($('#slider-range').slider('values', 0));
      $('#amount-2').val($('#slider-range').slider('values', 1));
    }
  }
}

GalleryGrid = {
  grid: $('#grid'),
  filterOptions: $('.js-grid-filter a'),
  sizer: $('.shuffle_sizer'),
  init: function() {
    setTimeout(function() {
      GalleryGrid.listen();
      GalleryGrid.setupFilters();
    }, 100);

    GalleryGrid.grid.shuffle({
      itemSelector: '[class*="col-"]',
      sizer: GalleryGrid.sizer,
    });
  },
  setupFilters: function(){
    var $btns = GalleryGrid.filterOptions;
    $btns.on('click', function(e) {
      e.preventDefault();
      var $this = $(this),
      isActive = $this.hasClass('active'),
      group = isActive ? 'all' : $this.data('group');

      if (!isActive) {
        $('.js-grid-filter a').removeClass('active');
      }

      $this.toggleClass('active');
      
      GalleryGrid.grid.shuffle('shuffle', group);
    });

    $btns = null;
  },
  listen: function() {
    var debouncedLayout = $.throttle(300, function() {
      GalleryGrid.grid.shuffle('update');
    });

    GalleryGrid.grid.find('img').each(function() {
      var proxyImage;
      if (this.complete && this.naturalWidth !== undefined) {
        return;
      }

      proxyImage = new Image();
      $(proxyImage).on('load', function() {
        $(this).off('load');
        debouncedLayout();
      });

      proxyImage.src = this.src;
    });

    setTimeout(function() {
      debouncedLayout();
    }, 500);
  }
}

// Donut charts
Charts = {
  pieChart1: null,
  pieChart2: null,
  lineChart1: null,
  lineChart2: null,
  init: function() {
    if ($('#donut-chart').length) {
      Morris.Donut({
        element: 'donut-chart',
        data: [
          {label: "USA", value: 43, color: '#2095f2'},
          {label: "Czech Republic ", value: 7, color: '#3e50b4'},
          {label: "Slovakia", value: 20, color: '#ccdb38'},
          {label: "Germany ", value: 20, color: '#fe9700'},
          {label: "Italy ", value: 10, color: '#e81d62'},
        ],
        resize: true,
        formatter: function (y, data) {
          return y + '%';
        },
          labelColor: '#363f45',
      });
    }

    if ($('#ct-chart-1').length) {
      Charts.pieChart1 = Chartist.Pie('#ct-chart-1', {
        series: [70, 30]
      }, {
        donut: true,
        donutWidth: 30,
        startAngle: 270,
        total: 200,
        showLabel: false,
        chartPadding: 0,
      });
    }

    if ($('#ct-chart-2').length) {
      Charts.pieChart2 = Chartist.Pie('#ct-chart-2', {
        series: [80, 20]
      }, {
        donut: true,
        donutWidth: 30,
        startAngle: 270,
        total: 200,
        showLabel: false,
        chartPadding: 0,
      });
    }

    if ($('#line-chart-1').length) {
      Charts.lineChart1 = Morris.Line({
        element: 'line-chart-1',
        parseTime: false,
        lineWidth: 1,
        data: [
          { date: '01.08.2015', value: 870 },
          { date: '02.08.2015', value: 825 },
          { date: '03.08.2015', value: 945 },
          { date: '04.08.2015', value: 934 },
          { date: '05.08.2015', value: 870 },
          { date: '06.08.2015', value: 983 },
          { date: '07.08.2015', value: 870 },
          { date: '08.08.2015', value: 920 },
        ],
        xkey: 'y',
        ykeys: ['value'],
        labels: ['Value'],
        lineColors: ['#fff'],
        grid: false,
        axes: false,
        hideHover: true,
        redraw: true,
        hoverCallback: function(index, options, content) {
          row = options.data[index];
          label = options.labels;

          function getValue(element){
            return element;
          }
          content = '<div class="text">' + row.date + ' - <span class="count">' + getValue(row.value) + '</span></div>';

          return(content);
        },
      });
    }

    if ($('#line-chart-2').length) {
      Charts.lineChart2 = Morris.Line({
        element: 'line-chart-2',
        parseTime: false,
        lineWidth: 1,
        data: [
          { date: '01.08.2015', value: 870 },
          { date: '02.08.2015', value: 825 },
          { date: '03.08.2015', value: 945 },
          { date: '04.08.2015', value: 934 },
          { date: '05.08.2015', value: 870 },
          { date: '06.08.2015', value: 983 },
          { date: '07.08.2015', value: 870 },
          { date: '08.08.2015', value: 920 },
        ],
        xkey: 'y',
        ykeys: ['value'],
        labels: ['Value'],
        lineColors: ['#fff'],
        grid: false,
        axes: false,
        hideHover: true,
        redraw: true,
        hoverCallback: function(index, options, content) {
          row = options.data[index];
          label = options.labels;

          function getValue(element){
            return element;
          }
          content = '<div class="text">' + row.date + ' - <span class="count">' + getValue(row.value) + '</span></div>';

          return(content);
        },
      });
    }

    // Charts.js
    /*var data = [
      { value: 43, color: '#2095f2', highlight: '#2095f2', label: 'USA' },
      { value: 7, color: '#3e50b4', highlight: '#3e50b4', label: 'Czech Republic' },
      { value: 20, color: '#ccdb38', highlight: '#ccdb38', label: 'Slovakia' },
      { value: 20, color: '#fe9700', highlight: '#fe9700', label: 'Germany' },
      { value: 10, color: '#e81d62', highlight: '#e81d62', label: 'Italy' }
    ]

    var ctx = $('#donut-chart-2').get(0).getContext('2d');
    var myDoughnutChart = new Chart(ctx).Doughnut(data, {
      animateScale: true,
      segmentShowStroke: false,
      responsive: true,
    });*/
  },

  lineChartsRedraw: function() {
    if ($('#ct-chart-1').length) {
      Charts.pieChart1.update();
    }
    if ($('#ct-chart-2').length) {
      Charts.pieChart2.update();
    }
    if ($('#line-chart-1').length) {
      Charts.lineChart1.redraw();
    }
    if ($('#line-chart-2').length) {
      Charts.lineChart2.redraw();
    }
  }
}