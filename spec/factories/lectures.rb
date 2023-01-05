FactoryBot.define do
  factory :lecture do
    description { "MyString" }
    duration { 1 }
    conference { nil }
    track { nil }
  end
end
