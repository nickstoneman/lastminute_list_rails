class AppointmentsController < ApplicationController
  

  def index
    @appointments = Appointment.all
    @subscribers = Subscriber.all
    @messages = Message.all
  end

  def show
    # messages = Message.all.order(:id)
    @appointment = Appointment.find(params[:id])
    # @messages = Message.all
    # @message = Message.find(params[:id])
    # @appointment = Appointment.new(message_params)
    # find(params[:id])
    # render :json => appointments
  end
    # :only => [:message_id]
    
    # render :json => messages
  def book
    subscriber = Subscriber.where(subscriber_email: params[:customer_name]).first
    appointment = Appointment.find(params[:id])
    #If the subscriber exists in the database
    if subscriber && appointment.filled != true 
      appointment.subscriber_id = subscriber.id
      appointment.filled = true
      appointment.save
      flash[:notice] = "You have booked the appointment"
      #Send a flash message saying you are booked into the appointment
    else
      flash[:notice] = "Sorry someone got there before you :-("
      #Send back a flash message saying the appointment has already been booked
    end

  end

    # @message = Message.new(message_params)
    # @messages = Message.all
  # end

end
