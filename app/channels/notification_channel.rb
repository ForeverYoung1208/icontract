class NotificationChannel < ApplicationCable::Channel
# class NotificationChannel < ActionCable::Channel::Base

  def subscribed
    # stream_from "some_channel"
    stream_for current_user_id
  end  	

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def check_events(data)
  	# data['date'] = DasteTime.now.strftime("%d.%m.%Y") unless data['date']

  	Event.all_send_emails( data['date'], current_user_id )
  end

end
