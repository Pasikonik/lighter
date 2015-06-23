FactoryGirl.define do
  factory :video do
    title       { Faker::Lorem.word.capitalize }
    description { Faker::Lorem.paragraph }
    remote      { Faker::Lorem.characters(10) }
    kind          Random.rand(1..2)
    user
  end
end
