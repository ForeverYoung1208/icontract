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
		email_text=''
  	email_text= %Q{
	  		Нагадування для користувача #{user.name}:
	  		<hr/>
	  		На дату #{on_date} в системі icontract зареєстровано подію з id=#{id},
	  		яку створено нагадуванням з id=#{reminder_id} до документу #{reminder.reminderable.doctype}, 
	  		№ #{reminder.reminderable.number} від #{reminder.reminderable.from_date}
	  		<hr/>
	  		Текст нагадування:<br/>
	  		#{reminder.message}
	  		<hr/>
	  		Будь-ласка, відпрацюйте та відзначте подію як відпрацьовану.
			}.squish

  	return "mail to event id=#{ id } is 'sent' to address #{user.email}" + email_text

  end

end
