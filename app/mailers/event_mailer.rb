class EventMailer < ApplicationMailer
	default from: 'icontract@inv.local'

	def event_notification(event)
		@event = event
		@reminderable = event.reminder.reminderable
    mail(:to => event.email_address, :subject => "icontract: #{@reminderable.doctype}, № #{@reminderable.number}, від #{@reminderable.from_date}")
	end

	def mail_failed_notification(to_email, event)
		@event = event
    mail(:to => to_email, :subject => "icontract: mail delivery failed")
	end

end
