# This will guess the User class
FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john@email.com"
    mobile_no "99999999"
    password "1234567"

    before(:create) do |user, evaluator|
      user.skip_confirmation!
    end
  end
end