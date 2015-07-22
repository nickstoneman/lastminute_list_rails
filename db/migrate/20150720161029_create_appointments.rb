class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.boolean :filled

      t.timestamps null: false
    end
  end
end
