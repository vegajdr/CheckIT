FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "example#{n}@example.com"}
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "password"
    admin? false

    factory :admin do
      admin? true
    end
  end
end
