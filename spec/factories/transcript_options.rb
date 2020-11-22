FactoryBot.define do
  factory :transcript_options do |_n|
    name { "AWS Speech Recognition - #{FactoryBot.generate(:random_id)}" }
    config do
      { provider: 'AWS',
        strategy: %i[segment localize analyse] }
    end
  end
end