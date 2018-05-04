class EventsUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def confirm!
    self.confirmed = true
    save
  end
end
