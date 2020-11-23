require 'rails_helper'

RSpec.describe Project, type: :model do

  let(:users) { [FactoryBot.create(:user), FactoryBot.create(:user)] }
  let(:name) {"project-name-#{FactoryBot.generate(:random_id)}"}
  let(:valid_attributes) {{ name: name, owner: users[0] }}
  
  context 'project creation' do

    it "has a name" do
      project = Project.create!(valid_attributes)
      expect(project.name).to  start_with('project-name')
    end

    it "has a owner" do
      project = Project.create!(valid_attributes)
      expect(project.owner.id).to be_truthy
      expect(project.owner.class).to eq(User)
    end

    it "has default user with role admin" do
      project = Project.create!(valid_attributes)
      expect(project.owner.has_role?(:admin, project))
    end

  end

  context 'adding roles' do

    it "add reviewers" do
      project = Project.create!(valid_attributes)
      project.add_roles(users, :reviewer)
      expect(project.reviewers.count).to eq(2)

      project.reviewers.each do |reviewer|
        expect(reviewer.id).to be_truthy
        expect(reviewer.class).to eq(User)
        expect(reviewer.has_role?(:reviewer, project)).to be_truthy
      end

    end

    it "add admins" do
      project = Project.create!(valid_attributes)
      project.add_roles(users, :admin)
      expect(project.admins.count).to eq(2)

      project.admins.each do |admin|
        expect(admin.id).to be_truthy
        expect(admin.class).to eq(User)
        expect(admin.has_role?(:admin, project)).to be_truthy
      end

    end

    pending "raise error when adding a hash of roles" do 
      project = Project.create!(valid_attributes)
      expect(project.add_roles({},:admin)).to raise_error
    end

    pending "raise error when adding role with nill user" do 
      project = Project.create!(valid_attributes)
      expect(project.add_roles(nil, :admin)).to raise_error
    end

  end

end
