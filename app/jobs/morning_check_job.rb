class MorningCheckJob < ApplicationJob
  queue_as :default

  def perform
		#MorningCheckJob.set(wait: 10.seconds).perform_later("xxx")


		logger.debug "Active Job start VVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
		

		Reminder.all_generate_events(DateTime.now.strftime("%d.%m.%Y"))
		Event.all_send_emails(DateTime.now.strftime("%d.%m.%Y"), ::MAIL_TO_ID)

		logger.debug "^^^^^^^^^^^^Active Job finish"

		# MorningCheckJob.set(wait: 10.seconds).perform_later
		MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day+1.hour).perform_later


  end

end
