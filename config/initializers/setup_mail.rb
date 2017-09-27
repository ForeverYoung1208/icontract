ActionMailer::Base.smtp_settings = {
  :address              => "10.23.200.12",
  :port                 => 25,
  :openssl_verify_mode => 'none'
}

ActionMailer::DeliveryJob.rescue_from(Net::SMTPFatalError) do |exception|
  # unless ['501 Command parsing failed'].include?(exception.message.strip)
  #   raise exception
  # end
  logger.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + exception.message)

end