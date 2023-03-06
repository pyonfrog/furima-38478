FactoryBot.define do
  factory :order_form do
    user_id        { Faker::Number.non_zero_digit }
    item_id        { Faker::Number.non_zero_digit }
    postal_code    { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    sender_area_id { Faker::Number.between(from: 1, to: 47) }
    municipality   { Faker::Address.city }
    house_number   { Faker::Address.street_address }
    building_name  { Faker::Address.street_address }
    tell           { Faker::Number.decimal_part(digits: 11) }
    token          { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
