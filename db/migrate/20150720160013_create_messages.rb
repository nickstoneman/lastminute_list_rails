class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sms_message_body
      t.datetime :appointment_time
      t.string :claim_appointment_url
      t.string :appointment_discount

      t.timestamps null: false
    end
  end
end
