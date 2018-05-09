class Task < ApplicationRecord
  has_ancestry
  extend Enumerize
  enumerize :status, in: [
    :pending,
    :in_progress,
    :complete
  ], default: :pending, scope: true

  enumerize :priority, in: [
    :low,
    :normal,
    :high
  ], default: :normal, scope: true

  has_many :tasks_users, dependent: :destroy
  has_many :users, through: :tasks_users

  has_many :subtasks, class_name: "Task", foreign_key: "ancestry"
  belongs_to :parent, class_name: "Task", optional: true, foreign_key: "ancestry"
  accepts_nested_attributes_for :subtasks, allow_destroy: true

  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true

  def have_subtasks?
    if children.count > 0
      return true
    end
    false
  end
end