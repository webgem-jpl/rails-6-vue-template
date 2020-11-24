class Record < ApplicationRecord
  belongs_to :project
  belongs_to :config
  has_one :transcript
end
