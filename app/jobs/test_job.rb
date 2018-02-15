class TestJob < ApplicationJob
  queue_as :default

  def perform
		# MorningCheckJob.set(wait: 5.seconds).perform_later("xxx")


		logger.debug "VVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
		logger.debug "Active Job start"
		
	  NotificationChannel.broadcast_to(
	    ::MAIL_TO_ID,
	    title: 'Information:',
	    body: "TestJob perform with arguments: #{arguments}"
	  )
		
		logger.debug "Active Job finish"
		logger.debug "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

		TestJob.set(wait: 10.seconds ).perform_later


  end

end
