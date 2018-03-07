class MorningCheckJob < ApplicationJob
  queue_as :default

  def perform
		# MorningCheckJob.set(wait: 5.seconds).perform_later("xxx")


		logger.debug "Active Job start VVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
		

		Reminder.all_generate_events(DateTime.now.strftime("%d.%m.%Y"))
		Event.all_send_emails(DateTime.now.strftime("%d.%m.%Y"), ::MAIL_TO_ID)

		logger.debug "^^^^ next at #{ Date.tomorrow.beginning_of_day+1.hour }^^^^^^^^Active Job finish"

		MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day+1.hour).perform_later


  end

end
