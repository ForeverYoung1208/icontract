class NotificationChannel < ApplicationCable::Channel
# class NotificationChannel < ActionCable::Channel::Base

  def subscribed
    stream_from "notification_channel"
    stream_for current_user_id
  end  	

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


end
