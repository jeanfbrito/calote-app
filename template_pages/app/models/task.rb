class Task < ApplicationRecord
  acts_as_tree
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
  
  def have_subtasks?
    if children.count > 0
      return true
    end
    false
  end
end