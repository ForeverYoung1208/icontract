# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# test


$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='contracts' && ["index", "all","mine"].indexOf($('meta[name=psj]').attr('action')) > 0
		$('.filters').on 'keyup', ->
			doFilter( $(this), $('#contracts-table tbody tr'))

	if $('meta[name=psj]').attr('controller')=='contracts' && ["new", "edit"].indexOf($('meta[name=psj]').attr('action')) > 0
		window.handleTypeChange = (select)->
			$('#contract_name').val( $(select).find('option:selected').data("contract-name") )





