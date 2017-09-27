class Event < ApplicationRecord
  belongs_to :reminder
  belongs_to :user

  default_scope { where("deleted_at IS NULL")}

  validates :reminder, uniqueness: {scope: [:on_date, :user_id, :deleted_at]}

  def self.all_send_emails(given_date_string, notify_user_id)
  	events = Event
  		.where("on_date<=?", given_date_string.to_date+1 )
  		.where(to_send: true)
  		.where("done_by ='' OR done_by IS NULL")

		sent_messages = []
  	events.each do |event|
  		sent_messages << event.send_email(given_date_string, notify_user_id)
  	end

  	return sent_messages

  end

  def send_email(given_date_string, notify_user_id)
    begin
      res = "id=#{ id } email=#{email_address};"
      EventMailer.event_notification(self).deliver_later

    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      res = "Problems sending mail " + e.message+"; "
    ensure
    	return res
    end      

    NotificationChannel.broadcast_to(
      notify_user_id,
      title: 'sending email',
      body: 'date:'+given_date_string
    )  

    # logger.debug "-----------------------sending email --------------------------" 


  end

end
