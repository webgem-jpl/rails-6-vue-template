FactoryBot.define do
  factory :transcript do

    record { create(:record)}
    project { record.project }
    transcript_option { create(:transcript_option) }
    url { "https://s3.fake-bucket/#{record.project.name}/master/transcript" }
    segments { "" }
    editable { "" }
    metrics { "" }

  end
end
