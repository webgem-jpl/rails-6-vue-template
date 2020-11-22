<<<<<<< HEAD
FactoryBot.define do
  factory :transcript_config do |_n|
    name { "AWS Speech Recognition - #{FactoryBot.generate(:random_id)}" }
    config do
      { provider: 'AWS',
        strategy: %i[segment localize analyse] }
    end
=======
# frozen_string_literal: true

FactoryBot.define do
<<<<<<< HEAD
  factory :transcript_config do
    name { 'MyString' }
    config { 'MyText' }
>>>>>>> cf5e129... scaffold: TranscriptionOption
=======
  factory :transcript_config do |_n|
    name { "AWS Speech Recognition - #{FactoryBot.generate(:random_id)}" }
    config do
      { provider: 'AWS',
        strategy: %i[segment localize analyse] }
    end
>>>>>>> cb7183c... spec: TranscriptConfig controller
  end
end
