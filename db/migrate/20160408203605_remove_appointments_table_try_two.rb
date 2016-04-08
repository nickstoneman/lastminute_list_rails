class RemoveAppointmentsTableTryTwo < ActiveRecord::Migration
  def up
  	drop_table :appointments 
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end

