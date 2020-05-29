FactoryBot.define do
  factory :random_item, class: GearItem do
    sequence(:name)   { Faker::Commerce.product_name }
    description       { Faker::Hipster.sentence(word_count: 5) }
    price             { Faker::Commerce.price(range: 0.1..100.0, as_string: false) }
    condition         { 0 }
    location          { Faker::Address.city}
    status            { 0 }
  end
end

