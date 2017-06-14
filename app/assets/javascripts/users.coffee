# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



class Users
	constructor: ()->
		@data = []
	fetch: ()->
		jqxhr = $.get("users.json")
			.done (res)=>
				@data = res
				@redrawTo( $('#ajaxUsers') ) 
	redrawTo: (el)->
		@data.each (user)->
			el.append('<div>'+user.name+'</div>')
			



$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='users' && $('meta[name=psj]').attr('action')=='index'
		users = new Users;
		users.fetch();
