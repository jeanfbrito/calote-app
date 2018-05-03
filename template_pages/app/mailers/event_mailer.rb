class EventMailer < ApplicationMailer
  def notification(event)
    @event = event
    mail(to: @event.users.map(&:email), subject: @event.email_title)
  end
end
