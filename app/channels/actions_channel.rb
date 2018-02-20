class ActionsChannel < ApplicationCable::Channel
# class NotificationChannel < ActionCable::Channel::Base


  def subscribed
    stream_from "actions_channel"
    stream_for current_user_id
    @current_user = User.find(current_user_id) if current_user_id

  end  	

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def take_untake(data)
    case data['type'] 
    when 'Akt'
      reminderable = Akt.find(data['id'])
    when 'Contract'
      reminderable = Contract.find(data['id'])
    end
    if @current_user.can_take_documents?
      data['is_taken_as_original'] = reminderable.take_untake!(@current_user)
      data['history'] = reminderable.history
      # ActionsChannel.broadcast_to( current_user_id, data)
      data['action']='take_untake_result'
      ActionCable.server.broadcast("actions_channel", data)      
    else
      raise Exeption 'Not enough rights to access reminderable(akt/contract)'
    end

  end

  def do_event(data)
    event = Event.unscoped.find(data['eventId'])
    data['text']=data['text']+" зафіксовано: #{@current_user.name}, (id:#{@current_user.id})."
    event.done_by = data['text']
    if event.save(validate:false)
      data['action']='do_event_result'
      ActionCable.server.broadcast("actions_channel", data)
    else
      logger.debug event
    end
  end

  def check_events(data)
    # data['date'] = DasteTime.now.strftime("%d.%m.%Y") unless data['date']

    Event.all_send_emails( data['date'], current_user_id )
  end

  def start_morning_check_job(data)
    res = MorningCheckJob.set(wait_until: Date.tomorrow.beginning_of_day).perform_later        
    data = {
      'title': "Information:",
      'body': "MorningCheckJob started: #{res}"
    }

    # works, but sends to all
    # ActionCable.server.broadcast("notification_channel", data)


    NotificationChannel.broadcast_to(current_user_id, data)

  end


end
