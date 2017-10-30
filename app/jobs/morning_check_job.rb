class MorningCheckJob < ApplicationJob
  queue_as :default

  def perform
		# MorningCheckJob.set(wait: 5.seconds).perform_later("xxx")


		MorningCheckJob.set(wail_until: Date.tomorrow.beginning_of_day).perform_later
		logger.debug "VVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
		logger.debug "Active Job start"
		

		Reminder.all_generate_events(date: DateTime.now.strftime("%d.%m.%Y"))
		Events.all_send_emails(date: DateTime.now.strftime("%d.%m.%Y"), ::MAIL_TO_ID)

		logger.debug "Active Job finish"
		logger.debug "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"



  end

end
