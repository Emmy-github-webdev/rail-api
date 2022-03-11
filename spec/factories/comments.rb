FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.word }
    post_id nil
    user_id nil
  end
end
