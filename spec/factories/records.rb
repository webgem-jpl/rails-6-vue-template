FactoryBot.define do
  factory :record do |id|
    name { "record-name-#{id}" }
    project { create(:project) }
    config { create(:config) }
    url { "https://s3.fake-bucket-#{id}.aws.com" }
    segments { '' }
  end
end
