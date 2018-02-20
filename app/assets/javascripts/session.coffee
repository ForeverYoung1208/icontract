# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.allSendEmailsEvents = (date)->
	data={ 
		date: date
	}
	App.actionsChannel.checkEvents(data)

window.startMorningCheckJob = () ->
	data={}
	App.actionsChannel.startMorningCheckJob(data)
