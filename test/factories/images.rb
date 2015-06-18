FactoryGirl.define do  
  factory :image do
    source { Rack::Test::UploadedFile.new("test/fixtures/files/test.jpg", "image/jpeg") } 
    kind     Random.rand(1..2)
  end
end