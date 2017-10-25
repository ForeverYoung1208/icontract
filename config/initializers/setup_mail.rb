
ActionMailer::Base.smtp_settings = {
  :address              => "10.23.200.12",
  :port                 => 25,
  :openssl_verify_mode => 'none'
}

# ActionMailer::DeliveryJob.rescue_from(Net::SMTPFatalError) do |e|
ActionMailer::DeliveryJob.rescue_from(StandardError) do |e|

  event = arguments[3]
  NotificationChannel.broadcast_to(
    ::MAIL_TO_ID,
    title: 'sending email failed:',
    body: "Event id: #{event.id}, user_id: #{event.user_id}, email:#{event.email_address}"
  )


  email_to=User.find(::MAIL_TO_ID).email


  res = EventMailer.mail_failed_notification(email_to,event).deliver_later

end