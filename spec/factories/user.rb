# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'jean-claude.brow@gmail.com' }
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end
end
