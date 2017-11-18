App.actionsChannel = App.cable.subscriptions.create "ActionsChannel",
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data["title"]+data["body"])



    STOPPED HERE   table = $('#akts-table') ############

    console.log "ActionsChannel:"
    console.log data["type"]
    console.log data["id"]
    console.log data["is_taken_as_original"]


  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  takeUntake: (data)->
    @perform 'take_untake', data
