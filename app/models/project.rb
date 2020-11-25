class Project < ApplicationRecord
  # adding roles with rolify
  resourcify

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :master_records, class_name: 'Record'
  has_many :master_transcripts, class_name: 'Transcript'

  after_create :add_owner_role

  def admins
    User.with_role(:admin, self)
  end

  def reviewers
    User.with_role(:reviewer, self)
  end

  def add_roles(users, role)
    users_array(users).each do |user|
      user.add_role(role, self)
    end
  end

  def remove_roles(_users, role)
    user_array.each do |user|
      user.remove_role(role, self)
    end
  end

  def add_owner_role
    add_roles([owner], :admin)
  end

  def users_array(users)
    users = Array(users) unless users.is_a?(Array)
    users
  end
end
