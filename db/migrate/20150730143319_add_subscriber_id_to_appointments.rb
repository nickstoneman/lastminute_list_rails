class AddSubscriberIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :subscriber_id, :integer
  end
end
