class Subscriber < ActiveRecord::Base
  belongs_to :user

  validates :subscriber_phone_number, presence: true
end
