FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'file.png'), 'image/png') }
    user
  end
end
