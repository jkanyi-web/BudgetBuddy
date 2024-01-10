include ActionDispatch::TestProcess

FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    icon { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file.png'), 'image/png') }
  end
end
