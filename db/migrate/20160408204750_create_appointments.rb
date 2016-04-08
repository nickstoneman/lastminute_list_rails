class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments, id: :uuid do |t|
      t.boolean :filled
      t.string :customer_name
      t.integer :message_id
      t.integer :subscriber_id

      t.timestamps null: false
    end
  end
end
