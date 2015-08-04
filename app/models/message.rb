class Message < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers
  has_one :appointment

  validates :sms_message_body, presence: true
  validates :appointment_time, presence: true

  before_create :reminder

  # to_number.each do |numbers|
  # subscriber.subscriber_phone_number = Subscribers.all
  # to_number = @subscriber(:subscriber_phone_number)

  # def numbers
  #   @subscribers.subscriber_phone_number.each do |phone_number|
  #     phone_number = subscribers.subscriber_phone_number['phone_number']
  # end

  # Notify people on the list about cancelled appoinments
  def reminder
    subscribers = Subscriber.all
    subscribers.each do |subscriber|
      phone_number = subscriber.subscriber_phone_number
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
        reminder = "#{self.sms_message_body} and #{self.appointment_time} and #{self.claim_appointment_url}"
        message = @client.account.messages.create(
          :from => @twilio_number,
          :to => phone_number,
          :body => reminder
        )
      end
      # binding.pry
      # binding.pry
      # binding.pry
      # nil
      # puts message.to
  end
end
