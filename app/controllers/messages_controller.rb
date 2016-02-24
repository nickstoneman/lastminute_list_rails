class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @appointments = Appointment.all
    @subscribers = Subscriber.all
    if @messages.length == 0
      flash[:alert] = "Let's get started. Create your first message."
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  def new
    @message = Message.new
    @min_date = DateTime.now
    @subscribers = Subscriber.all
    # @user = User.find(params[:user_id])
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @subscribers = Subscriber.all
    @message = Message.new(message_params)
    @appointment = Appointment.create(message_id:@message.id)
    @message.claim_appointment_url = "http://www.localhost:3000/appointments/#{@appointment.id}"
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update.(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
      format.json { render :show, status: :ok, location: @message }
    else
      format.html { render :edit }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully deleted.' }
      format.json { head :no_content }
    end
  end

#   def show
#     @message = Message.find(params[:id])
#   end

#   def edit
#     @message = Message.find(params[:id])
#   end


private
  def set_message
    @message = Message.find(params[:id])
    # params.require(:message).permit(:sms_message_body, :appointment_time, :claim_appointment_url)
  end

  def message_params
    params.require(:message).permit(:sms_message_body, :appointment_time, :appointment_discount, :claim_appointment_url)
  end
end

