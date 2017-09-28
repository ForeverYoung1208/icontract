App.notificationChannel = App.cable.subscriptions.create "NotificationChannel",
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data["title"]+data["body"])
    console.log data["title"]
    console.log data["body"]

    if data["title"] == 'sending email failed:'
    	$("#dialog-mail-delivery-failed #message").html( data["body"])
	    $("#dialog-mail-delivery-failed").dialog( "open" )


  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  checkEvents: (data)->
    @perform 'check_events', data
