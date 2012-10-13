# This will guess the User class
FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) { |n| "john#{n}@email.com" }
    mobile_no "9999999"
    password "1234567"

    before(:create) do |user, evaluator|
      user.skip_confirmation!
    end
  end
end