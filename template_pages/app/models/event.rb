class Event < ApplicationRecord
  belongs_to :forum
  belongs_to :president, class_name: 'User', foreign_key: :president_id
  belongs_to :secretary, class_name: 'User', foreign_key: :secretary_id
  belongs_to :user

  has_and_belongs_to_many :users

  has_many :subjects, inverse_of: :event
  accepts_nested_attributes_for :subjects,
                                reject_if: :all_blank,
                                allow_destroy: true


  SITUATION = [:draft , :confirmed]
  enum situation: SITUATION

  scope :from_user, -> (user_id) {
    includes(:users).references(:users)
    .where('events.user_id == ? OR events_users.user_id == ?', user_id, user_id)
    .distinct
  }

  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start_at == self.start_at.midnight && self.end_at == self.end_at.midnight ? true : false
  end

  def initialize(*args)
    super
    self.number = Event.last.try(:id).to_i + 1
  end

  def email_title
    "[Nova reunião] - #{title}"
  end
end
