class Subject < ApplicationRecord
  belongs_to :event, optional: true
  has_and_belongs_to_many :users
  has_many_attached :files

  def has_user?(user)
    users.map(&:id).include?(user.id)
  end
end
