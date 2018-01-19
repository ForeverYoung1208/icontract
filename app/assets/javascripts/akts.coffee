# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='akts' && ["index", "all","mine"].indexOf($('meta[name=psj]').attr('action')) >= 0
		$('.filters').on 'keyup', ->
			doFilter( $(this), $('#akts-table tbody tr'))