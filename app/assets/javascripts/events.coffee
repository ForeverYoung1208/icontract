# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='events' && ["index", "all","mine"].indexOf($('meta[name=psj]').attr('action')) > 0
		window.eventDoneClick = (eventId) ->
			$('#eventReportText').text('Подію №'+eventId+' виконано шляхом: ')

		window.submitEventDoneReport = ()->
			$("#eventDoneByModal").modal('hide')
			alert( $('#eventReportText').text() )


	