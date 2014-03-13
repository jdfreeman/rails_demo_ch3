# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :micropost do
    content SecureRandom.hex(SecureRandom.random_number(69) + 1)
    user
  end
end

