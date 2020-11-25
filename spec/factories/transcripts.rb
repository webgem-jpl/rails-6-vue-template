FactoryBot.define do
  factory :transcript do
    record { create(:record) }
    project { record.project }
    config { create(:config) }
    url { "https://s3.fake-bucket/#{record.project.name}/master/transcript" }
    segments { '' }
    editable { '' }
    metrics { '' }
  end
end
