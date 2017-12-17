# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='events' && ["index", "all","mine"].indexOf($('meta[name=psj]').attr('action')) > 0
		# Set filters
		$('.filters').on 'keyup', ->
			doFilter( $(this), $('#events-table tbody tr'))
		# Set default filter
		df = $('#default-filter')
		df.val('Ні')
		doFilter( df, $('#events-table tbody tr'))

		# Prepare modal window text
		window.eventDoneClick = (eventId) ->
			modal = $('#eventDoneByModal')
			modal.find('#eventReportText').text('Подію №'+eventId+' виконано. Звіт: ')
			modal.data('eventId', eventId)
			modal.modal()

		window.submitEventDoneReport = ()->
			modal = $('#eventDoneByModal')
			modal.modal('hide')
			data ={
				'eventId': modal.data('eventId'),
				'text': modal.find('#eventReportText').val()
			}
			App.actionsChannel.doEvent(data)
			console.log data


	