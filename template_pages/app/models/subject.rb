class Subject < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user, optional: true
  has_many_attached :files
end
