class SubscribersController < ApplicationController

  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  # belongs_to :user
  
  # validates :customer_name, presence: true
  # validates :subscriber_phone_number, presence: true
  # validates :subscriber_email, presence: true

  def index
    @subscribers = Subscriber.all
  end

  def show
  end
  
  def new
    @subscriber = Subscriber.new
    @min_date = DateTime.now
    # @user = User.find(params[:user_id])
  end

  def edit
  end

  # POST /subscriber
  def create
    @subscriber = Subscriber.new(subscriber_params)
    
    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to @subscriber, notice: 'Success. You\'re on the list!.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subscriber.update.(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
      format.json { render :show, status: :ok, location: @subscriber }
    else
      format.html { render :edit }
      format.json { render json: @subscriber.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully deleted.' }
      format.json { head :no_content }
    end
  end


private
  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:subscriber_phone_number, :subscriber_email)
  end
end