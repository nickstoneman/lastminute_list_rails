class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :subscriber_phone_number
      t.string :subscriber_email
      t.string :subscriber_gender

      t.timestamps null: false
    end
  end
end
