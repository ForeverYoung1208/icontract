# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='users' && $('meta[name=psj]').attr('action')=='index'
		Users = []
		Users.fetch = ()->
			alert('fetching users')
		Users.redraw = (el)->
			alert('redrawing to '+el)


		users = Users;
		users.fetch();
		users.redraw( $('#ajaxUsers') )