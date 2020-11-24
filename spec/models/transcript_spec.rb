require 'rails_helper'

# t.belongs_to :project, null: false, foreign_key: true
# t.belongs_to :record, null: false, foreign_key: true
# t.belongs_to :transcript_option, null: false, foreign_key: true
# t.string :url
# t.text :editable
# t.text :segments
# t.text :metrics


RSpec.describe Transcript, type: :model do

  let(:record) { create(:record) }
  let(:transcript_option){ create(:transcript_option)}
  let(:valid_attributes) {
    { record: record,
    project: record.project,
    transcript_option: transcript_option,
    url: 'https://s3.fake-bucket/project/master/transcript'
    }
  }
  let (:text) {
    {}.merge({'words': ['I','think','therefore',',','I','am']})
  }
  let (:metrics) {
    {'confidence_level': 89 }
  }

  let(:transcript) {create(:transcript)}

  context "creation" do
    it 'has a project' do
      transcript = Transcript.create!(valid_attributes)
      expect(transcript.project.class).to eq(Project)
      expect(transcript.project).to eq(record.project)
    end

    it 'has a record' do
      transcript = Transcript.create!(valid_attributes)
      expect(transcript.record.class).to eq(Record)
      expect(transcript.record).to eq(record)
    end

    it 'has a transcription option' do
      transcript = Transcript.create!(valid_attributes)
      expect(transcript.transcript_option.class).to eq(TranscriptOption)
      expect(transcript.transcript_option).to eq(transcript_option)
    end

    context "edition:"
    it 'editable object' do
      transcript = Transcript.create!(valid_attributes)
      transcript.editable = text
      expect(transcript.editable['words'][0]).to eq('I')
    end

    it 'segments object' do
      transcript = Transcript.create!(valid_attributes)
      transcript.segments = text
      expect(transcript.segments['words'][0]).to eq('I')
    end

    it ' a metrics object' do
      transcript = Transcript.create!(valid_attributes)
      transcript.metrics = metrics
      expect(transcript.metrics['confidence_level']).to eq(89)
    end

  end

end
