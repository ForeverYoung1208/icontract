class MorningCheckJob < ApplicationJob
  queue_as :default

  def perform
		# MorningCheckJob.set(wait: 5.seconds).perform_later("xxx")


		logger.debug "VVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
		logger.debug "Active Job start"
		

		Reminder.all_generate_events(DateTime.now.strftime("%d.%m.%Y"))
		Event.all_send_emails(DateTime.now.strftime("%d.%m.%Y"), ::MAIL_TO_ID)

		logger.debug "Active Job finish"
		logger.debug "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

		# MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day).perform_later


  end

end
