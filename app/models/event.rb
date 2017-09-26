class Event < ApplicationRecord
  belongs_to :reminder
  belongs_to :user

  default_scope { where("deleted_at IS NULL")}

  validates :reminder, uniqueness: {scope: [:on_date, :user_id, :deleted_at]}

  def self.all_send_emails(given_date_string)
  	events = Event
  		.where("on_date<=?", given_date_string.to_date+1 )
  		.where(to_send: true)
  		.where("done_by ='' OR done_by IS NULL")

		sent_messages = []
  	events.each do |event|
  		sent_messages << event.send_email
  	end

  	return sent_messages

  end

  def send_email
    EventMailer.event_notification(self).deliver_later
  	return "id=#{ id } email=#{user.email};"

  end

end
