json.array!(@messages) do |message|
  json.extract! message, :id, :sms_message_body, :claim_appointment_url, :appointment_time
  json.url message_url(message, format: :json)
end