App.notificationChannel = App.cable.subscriptions.create "NotificationChannel",
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert(data["title"]+data["body"])
    console.log data["title"]
    console.log data["body"]

    if data["title"] == 'sending email failed:'
    	$("#dialog-information #message").html( data["title"]+', '+data["body"])
	    $("#dialog-information").dialog( "open" )

    if data["title"] == 'Information:'
      $("#dialog-information #message").html( data["title"]+', '+data["body"])
      $("#dialog-information").dialog( "open" )

  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

