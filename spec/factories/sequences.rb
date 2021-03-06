FactoryBot.define do
  sequence(:random_id) do |n|
    @random_ids ||= (1..100_000).to_a.shuffle
    @random_ids[n]
  end
end
