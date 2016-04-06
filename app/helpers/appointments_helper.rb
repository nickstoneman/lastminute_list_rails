module AppointmentsHelper

  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def booked_or_not(boolean)
  	if boolean == true
  		"Sorry, you're to late. This appointment/reservation has been filled."
  	else
  		"This appointment/reservation is still available."
  end
end

end