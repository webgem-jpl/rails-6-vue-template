class Transcript < ApplicationRecord
  belongs_to :project
  belongs_to :record
  belongs_to :config
end
