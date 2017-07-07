# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='contracts' && $('meta[name=psj]').attr('action')=='all'
		console.log 'all'

	if $('meta[name=psj]').attr('controller')=='contracts' && $('meta[name=psj]').attr('action')=='mine'
		console.log 'mine'
