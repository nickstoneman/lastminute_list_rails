class AddCustomerNameToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :customer_name, :string
  end
end
