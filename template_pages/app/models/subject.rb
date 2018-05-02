class Subject < ApplicationRecord
  belongs_to :event, optional: true
  has_many_attached :files
end
