class AppointmentsChangePrimaryKeyColumnToUuid < ActiveRecord::Migration
  def change
  	change_table :appointments, id: :uuid do |t|
      # t.boolean :filled

      # t.timestamps null: false
      t.remove :id
      t.rename :uuid, :id
  	end
  end
end
