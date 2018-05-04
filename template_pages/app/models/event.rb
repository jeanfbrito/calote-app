class Event < ApplicationRecord
  belongs_to :forum
  belongs_to :president, class_name: 'User', foreign_key: :president_id, optional: true
  belongs_to :secretary, class_name: 'User', foreign_key: :secretary_id, optional: true
  belongs_to :user

  has_many :events_users, dependent: :destroy
  has_many :users, through: :events_users

  has_many :subjects, inverse_of: :event, dependent: :destroy
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

  validates :title, :forum_id, presence: true
  attr_accessor :date_range

  before_save :set_number
  after_create :send_mail

  def all_day_event?
    self.start_at == self.start_at.midnight && self.end_at == self.end_at.midnight ? true : false
  end

  def set_number
    return unless self.number.blank?
    self.number = forum.events.count + 1
  end

  def send_mail
    EventMailer.notification(self).deliver_now if users.any?
  end

  def confirmed?(user_id)
    !!events_users.find_by(user_id: user_id).try(:confirmed)
  end
end
