FactoryGirl.define do
  factory :post do
    title "MyString"
    content "MyText"
    subcheckit
    user
  end
end
