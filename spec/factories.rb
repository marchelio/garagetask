FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :project do
    title "Exemple Project"
    user
  end
  factory :task do
    content "Exemple Task"
    project
  end
end