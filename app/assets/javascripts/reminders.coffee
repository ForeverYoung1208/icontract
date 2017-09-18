# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hideUnselectedRemiderableTypes = ( whatIsSelected )->
	switch whatIsSelected
		when 'Akt'
			$('#row-contracts').hide()
			$('#row-akts').show()
		when 'Contract'
			$('#row-contracts').show()
			$('#row-akts').hide()

$(document).on 'turbolinks:load', ->
	hideUnselectedRemiderableTypes( $('.reminderable-type-rb:checked').val() )
	if $('meta[name=psj]').attr('controller')=='reminders' && ( $('meta[name=psj]').attr('action')=='edit' || $('meta[name=psj]').attr('action')=='new')
		$('.reminderable-type-rb').on('click', ->
				hideUnselectedRemiderableTypes( $('.reminderable-type-rb:checked').val() )
			)
		