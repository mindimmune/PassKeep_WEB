FactoryGirl.define do
  factory :user, class: :User do
    sequence(:email) { |n| "test_#{n}@email.com" }
    password "foobar"
    password_confirmation "foobar"
    activation_state "active"
  end
end
