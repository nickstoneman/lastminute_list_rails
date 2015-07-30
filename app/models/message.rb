class Message < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers
  has_one :appointment

  validates :sms_message_body, presence: true
  validates :appointment_time, presence: true

  after_create :reminder

  # Notify people on the list about cancelled appoinments
  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    reminder = "#{self.sms_message_body} and #{self.appointment_time} and #{self.claim_appointment_url}"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => '+447889216333',
      :body => reminder,
    )
    puts message.to
  end
end
