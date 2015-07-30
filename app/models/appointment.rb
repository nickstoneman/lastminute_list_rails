class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  belongs_to :subscriber

end
