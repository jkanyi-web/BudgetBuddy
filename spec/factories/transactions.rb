FactoryBot.define do
  factory :transaction do
    title { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    category
    user
  end
end
