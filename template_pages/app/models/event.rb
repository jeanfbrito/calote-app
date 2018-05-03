class Event < ApplicationRecord
  has_one :forum
  has_one :president, class_name: 'User', foreign_key: :president_id
  has_one :secretary, class_name: 'User', foreign_key: :secretary_id
  belongs_to :user

  has_and_belongs_to_many :users

  has_many :subjects, inverse_of: :event
  accepts_nested_attributes_for :subjects,
                                reject_if: :all_blank,
                                allow_destroy: true


  SITUATION = [:draft , :confirmed]
  enum situation: SITUATION

  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start_at == self.start_at.midnight && self.end_at == self.end_at.midnight ? true : false
  end

  def initialize(*args)
    super
    self.number = Event.last.try(:id).to_i + 1
  end
end
