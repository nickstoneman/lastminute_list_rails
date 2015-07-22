class Message < ActiveRecord::Base
  belongs_to :user

  validates :sms_message_body, presence: true
  validates :appointment_time, presence: true
  validates :claim_appointment_url, presence: true
end
