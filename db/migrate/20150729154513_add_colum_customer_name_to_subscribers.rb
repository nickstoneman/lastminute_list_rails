class AddColumCustomerNameToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :customer_name, :string
  end
end