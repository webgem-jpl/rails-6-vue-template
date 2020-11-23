class Project < ApplicationRecord
    # adding roles with rolify
    resourcify

    belongs_to :owner, class_name: 'User', foreign_key: :user_id
    
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

    def remove_roles(users, role)
        user_array.each do |user|
            user.remove_role(role, self)
        end
    end

    def users_array(users)
        users = Array(users) if !users.kind_of?(Array)
        users
    end

end