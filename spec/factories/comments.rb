FactoryGirl.define do
  factory :comment do
    user nil
    message nil
    comment "MyText"
    vote_id 1
  end
end
