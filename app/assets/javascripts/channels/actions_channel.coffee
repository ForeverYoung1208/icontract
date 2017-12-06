App.actionsChannel = App.cable.subscriptions.create "ActionsChannel",
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data["title"]+data["body"])

    switch data['action']
      when 'take_untake_result' 
        entity = $('[data-entityId="'+data["id"]+'"]').find('.entity-is-taken')

        if data["is_taken_as_original"]==true
          entity.find('span').text('Так') 
          entity.find('.take-button').addClass('hidden')
          entity.find('.untake-button').removeClass('hidden')
        else
          entity.find('span').text('Ні') 
          entity.find('.take-button').removeClass('hidden')
          entity.find('.untake-button').addClass('hidden')
      when 'do_event_result'
        entity = $('[data-entityId="'+data["eventId"]+'"]').find('.done-by')
        if data['text']
          entity.text(data['text'])



    console.log data



  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  takeUntake: (data)->
    @perform 'take_untake', data

  doEvent: (data)->
    @perform 'do_event', data
