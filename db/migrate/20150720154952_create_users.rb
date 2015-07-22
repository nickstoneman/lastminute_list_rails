class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :business_name
      t.string :business_logo
      t.string :business_address

      t.timestamps null: false
    end
  end
end
