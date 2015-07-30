json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :subscriber_phone_number, :subscriber_email
  json.url subscriber_url(subscriber, format: :json)
end