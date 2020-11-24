require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:users) { [FactoryBot.create(:user), FactoryBot.create(:user)] }
  let(:name) { "project-name-#{FactoryBot.generate(:random_id)}" }
  let(:valid_attributes) { { name: name, owner: create(:user) } }
  let (:url) { 'https:/s3.fake-bucket.com/project' }

  context 'Creation' do
    it 'has a name' do
      project = Project.create!(valid_attributes)
      expect(project.name).to start_with('project-name')
    end

    it 'has a owner' do
      project = Project.create!(valid_attributes)
      expect(project.owner.id).to be_truthy
      expect(project.owner.class).to eq(User)
    end

    it 'has default user with role admin' do
      project = Project.create!(valid_attributes)
      expect(project.owner.has_role?(:admin, project)).to be_truthy
    end
  end

  context "master:" do

    it 'add a master record' do
      project = Project.create!(valid_attributes)
      project.master_records << create(:record)
      project.save!
      expect(project.master_records.first.class).to be(Record)
    end

    it 'has a master record url' do
      project = Project.create!(valid_attributes)
      project.master_records << create(:record)
      project.save!
      expect(project.master_records.first.url).to be_truthy
    end

    it 'add a master transcript' do
      project = Project.create!(valid_attributes)
      project.master_transcripts << create(:transcript)
      project.save!
      expect(project.master_transcripts.first.class).to be(Transcript)
    end

    it 'has master reference transcript url' do
      project = Project.create!(valid_attributes)
      project.master_transcripts << create(:transcript)
      project.save!
      expect(project.master_transcripts.first.url).to be_truthy
    end

  end

  context 'adding roles:' do
    it 'reviewers' do
      project = Project.create!(valid_attributes)
      project.add_roles(users, :reviewer)
      expect(project.reviewers.count).to eq(2)

      project.reviewers.each do |reviewer|
        expect(reviewer.id).to be_truthy
        expect(reviewer.class).to eq(User)
        expect(reviewer.has_role?(:reviewer, project)).to be_truthy
      end
    end

    it 'admins' do
      project = Project.create!(valid_attributes)
      expect(project.admins.count).to eq(1)
      project.add_roles(users, :admin)
      expect(project.admins.count).to eq(3)

      project.admins.each do |admin|
        expect(admin.id).to be_truthy
        expect(admin.class).to eq(User)
        expect(admin.has_role?(:admin, project)).to be_truthy
      end
    end

    pending 'raise error when adding a hash of roles' do
      project = Project.create!(valid_attributes)
      expect(project.add_roles({}, :admin)).to raise_error
    end

    pending 'raise error when adding role with nill user' do
      project = Project.create!(valid_attributes)
      expect(project.add_roles(nil, :admin)).to raise_error
    end
  end
end
