FactoryGirl.define do  
  factory :user do
    email    { Faker::Internet.email}
    username { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
  
    factory :admin do
      admin true
    end
  end
end