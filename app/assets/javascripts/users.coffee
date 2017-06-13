# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



class Users
	@data: []
	fetch: ()->
		jqxhr = $.get("users.json")
			.done (res)->
				console.log( res )
				@data = res
			.always ()->
				console.log('fetching users always')
	redraw: (el)->
		console.log('redrawing to '+el)



$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='users' && $('meta[name=psj]').attr('action')=='index'
		users = new Users;
		users.fetch();
		users.redraw( $('#ajaxUsers') )
		console.log( users.data+ 'jjjjjj' )