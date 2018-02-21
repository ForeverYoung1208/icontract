# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.allSendEmailsEvents = (date)->
	data={ 
		date: date
	}
	App.actionsChannel.checkEvents(data) if confirm("Ви впевнені що треба зараз перевірити всі події на сьогоді і відправити e-mail листи ?")

window.startMorningCheckJob = () ->
	data={}
	App.actionsChannel.startMorningCheckJob(data) if confirm("Ви впевнені що треба почати новий процесс щоденних перевірок нагадувань і подій ?")

window.clearResque = () ->
	data={}
	App.actionsChannel.clearResque(data) if confirm("Ви впевнені що треба очистити REDIS:RESQUE, скасувати всі відкладені завдання і зупунити всі процеси перевірок?")
