FactoryBot.define do
  factory :regular_user, class: User do
    name              { Faker::Games::Overwatch.hero }
    street_address    { Faker::Address.street_address }
    city              { Faker::Address.city }
    state             { Faker::Address.state_abbr }
    zip               { Faker::Address.zip }
    email             { Faker::Internet.email }
  end
end
