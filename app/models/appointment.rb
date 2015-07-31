class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  belongs_to :subscriber

  #   create_table "appointments", force: :cascade do |t|
  #   t.boolean  "filled"

end
