FactoryGirl.define do

  sequence :email do |n|
    "person_#{n}@example.com"
  end

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    email { generate(:email) }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
