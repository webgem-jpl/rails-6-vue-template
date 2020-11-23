FactoryBot.define do
  factory :project do |n|
    name { "project-name-#{n}" }
    owner { create(:user) }
  end
end
