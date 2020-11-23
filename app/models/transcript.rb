class Transcript < ApplicationRecord
  belongs_to :project
  belongs_to :record
end
