FactoryGirl.define do  
  factory :tutorial do
    title { Faker::Lorem.word.capitalize }
    video { Rack::Test::UploadedFile.new("test/fixtures/files/test.mp4", "video/mp4") } 
    level   Random.rand(1..5)
  end
end