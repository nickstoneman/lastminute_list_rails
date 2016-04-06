# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Appointment.delete_all
Message.delete_all
Subscriber.delete_all
User.delete_all
Appointment.delete_all

Message.create(	sms_message_body: 'some test goes here', 
				appointment_time: '2015-07-24 12:00:00 UTC', 
				claim_appointment_url: 'http://www.localhost:3000/appointments/1', 
				appointment_discount: '25' )

User.create(business_name: 'Clippy Snips', business_logo: 'string.url', business_address: '123 Fake Street')

Subscriber.create(subscriber_phone_number: '347-430-9294', subscriber_email: 'nick@mail.com', subscriber_gender: 'male')

Appointment.create(customer_name: 'Penelope Carmichal')