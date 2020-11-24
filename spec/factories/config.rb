FactoryBot.define do
  factory :config do |_n|
    id
    name { "AWS Speech Recognition - #{FactoryBot.generate(:random_id)}" }
    config do
      { provider: 'AWS',
        strategy: %i[segment localize analyse] }
    end
  end
end
