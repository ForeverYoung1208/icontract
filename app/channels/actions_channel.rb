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
      # ActionsChannel.broadcast_to( current_user_id, data)
      data['action']='take_untake_result'
      ActionCable.server.broadcast("actions_channel", data)      
    else
      raise Exeption 'Not enough rights to access akts'
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

end
