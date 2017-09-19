# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hideUnselectedRemiderableTypes = ( ReminderableTypeSelected )->
	switch ReminderableTypeSelected
		when 'Akt'
			$('#row-contracts').hide()
			$('#row-akts').show()
		when 'Contract'
			$('#row-contracts').show()
			$('#row-akts').hide()

hideUnusedDateParts = (ReminderTypeSelected) ->
	switch ReminderTypeSelected
		when '1' # weekly
			$('#reminder_dd').hide();
			$('#reminder_mm').hide();
			$('#reminder_yyyy').hide();
			$('#reminder_dofw').show();
		when '2' # monthly
			$('#reminder_dd').show();
			$('#reminder_mm').hide();
			$('#reminder_yyyy').hide();
			$('#reminder_dofw').hide();
		when '3' # quoterly
			$('#reminder_dd').show();
			$('#reminder_mm').show();
			$('#reminder_yyyy').hide();
			$('#reminder_dofw').hide();
		when '4' # yearly
			$('#reminder_dd').show();
			$('#reminder_mm').show();
			$('#reminder_yyyy').hide();
			$('#reminder_dofw').hide();

$(document).on 'turbolinks:load', ->

	if $('meta[name=psj]').attr('controller')=='reminders' && ( $('meta[name=psj]').attr('action')=='edit' || $('meta[name=psj]').attr('action')=='new')
		hideUnselectedRemiderableTypes( $('.reminderable-type-rb:checked').val() )
		hideUnusedDateParts( $('#reminder-types').val() )

		$('.reminderable-type-rb').on('click', ->
				hideUnselectedRemiderableTypes( $('.reminderable-type-rb:checked').val() )
		)
		$('#reminder-types').on('change', ->
			hideUnusedDateParts( $('#reminder-types').val() )
		)

