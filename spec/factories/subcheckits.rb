FactoryGirl.define do
  factory :subcheckit do
    name Faker::Book.title
    category Faker::Book.genre
  end
end
