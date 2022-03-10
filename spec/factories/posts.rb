FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    text { Faker::Lorem.word }
  end
end
