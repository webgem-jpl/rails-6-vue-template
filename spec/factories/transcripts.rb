FactoryBot.define do
  factory :transcript do

    record { create(:record)}
    project { record.project }
    segments { "" }

  end
end
