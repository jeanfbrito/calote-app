class Comment < ApplicationRecord
  has_ancestry
  belongs_to :user
  belongs_to :task

  has_many :subcomments, class_name: "Comment", foreign_key: "ancestry"
  belongs_to :parent, class_name: "Comment", optional: true, foreign_key: "ancestry"
  accepts_nested_attributes_for :subcomments

  has_many_attached :files

  def have_subcomments?
    if children.count > 0
      return true
    end
    false
  end
end
