FactoryBot.define do
  factory :message do
    context { "MyText" }
    user { nil }
    inbox { nil }
  end
end
