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
  		sent_messages << event.send_email
  	end
    NotificationChannel.broadcast_to(
      notify_user_id,
      title: 'sending emails:',
      body: sent_messages
    )  
  	return sent_messages
  end


  def send_email
    res = "try id=#{ id } email=#{email_address};"
    EventMailer.event_notification(self).deliver_later
  	return res
  end

end
