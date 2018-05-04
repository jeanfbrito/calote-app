class EventMailer < ApplicationMailer
  def notification(event)
    @event = event
    mail(to: @event.users.map(&:email), subject: "[Nova reunião] - #{@event.title}")
  end
end
