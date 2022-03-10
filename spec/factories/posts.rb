FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    text { Faker::Lorem.word }
    authorid { Faker::Number.number(10) }
  end
end
