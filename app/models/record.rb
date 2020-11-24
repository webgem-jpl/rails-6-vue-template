class Record < ApplicationRecord
  belongs_to :project
  belongs_to :transcript_option
  has_one :transcript
end
