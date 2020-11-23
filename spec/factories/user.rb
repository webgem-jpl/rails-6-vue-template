FactoryBot.define do
  factory :user do
    id
    email
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end
end
