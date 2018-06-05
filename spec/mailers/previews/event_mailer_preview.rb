# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  def event_notification
  	event = Event.last
    EventMailer.event_notification(event)
  end	

end
