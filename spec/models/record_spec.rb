require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:transcript_option) { create(:transcript_option) }
  let(:project) { create(:project) }
  let(:valid_attributes) do
    { name: 'record-name',
      project: project,
      transcript_option: transcript_option,
      url: "https://s3.fake-bucket.aws.com/project-#{project.id}/master/record" }
  end

  context 'record creation' do
    it 'has a name' do
      record = Record.create!(valid_attributes)
      expect(record.name).to eq('record-name')
    end
    it 'has a project' do
      record = Record.create!(valid_attributes)
      expect(record.project).to be_truthy
    end
    it 'has a transcript option' do
      record = Record.create!(valid_attributes)
      expect(record.transcript_option).to be_truthy
    end
  end
end
