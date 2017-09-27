class EventMailer < ApplicationMailer
	default from: 'icontract@inv.local'

	def event_notification(event)
		@event = event
		@reminderable = event.reminder.reminderable

    mail(:to => event.email_address, :subject => "icontract: #{@reminderable.doctype}, № #{@reminderable.number}, від #{@reminderable.from_date}")
	end

end
