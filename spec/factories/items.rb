FactoryBot.define do
  factory :item do
    # image          { "" }
    name           { Faker::Name.initials(number: 40) }
    description    { Faker::Name.initials(number: 1000) }
    category_id    { Faker::Number.between(from: 2, to: 11) }
    condition_id   { Faker::Number.between(from: 2, to: 7) }
    postage_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    set_up_time_id { Faker::Number.between(from: 2, to: 4) }
    price          { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
