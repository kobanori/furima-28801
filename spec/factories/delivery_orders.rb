FactoryBot.define do
  factory :delivery_order do
    postcode{ '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
  end
end
