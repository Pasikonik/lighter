FactoryGirl.define do
  factory :entry do
    title     { Faker::Lorem.word.capitalize }
    body      { Faker::Lorem.paragraph }    
    thumbnail { Rack::Test::UploadedFile.new("test/fixtures/files/test.jpg", "image/jpeg") }   
    user
  end
end
