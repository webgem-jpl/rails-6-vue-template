FactoryBot.define do
  factory :transcript_config do |_n|
    name { "AWS Speech Recognition - #{FactoryBot.generate(:random_id)}" }
    config do
      { provider: 'AWS',
        strategy: %i[segment localize analyse] }
    end
  end
end
