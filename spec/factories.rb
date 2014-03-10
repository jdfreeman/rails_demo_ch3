FactoryGirl.define do
  factory :user do
    name 'Michael Hartl'
    email 'hartl@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :user_gravitar do
    name 'Michael Hartl'
    email 'example@railstutorial.com'
    gravitar_src "https://secure.gravatar.com/avatar/f1a6a90ea0fceff55be9e5abf44f9a1e"
  end
end
