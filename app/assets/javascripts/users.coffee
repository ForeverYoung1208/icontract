# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $( "#droppable" ).droppable({
#   drop: function( event, ui ) {
#     $( this )
#       .addClass( "ui-state-highlight" )
#       .find( "p" )
#         .html( "Dropped!" );
#   }

window.dragRole = (event)->
	console.log('drag')

class Users
	constructor: ()->
		@data = []
	fetch: ()->
		jqxhr = $.get("users.json")
			.done (res)=>
				@data = res
				@redrawTo( $('#ajaxUsers') ) 
	redrawTo: (el)=>
		inTag = el.attr('inTag')
		inTag2 = el.attr('inTag2')
		for user in @data 
			do (user)=>
				el.append( '<'+inTag+'>' + 
					'<'+inTag2+'>' + user.id + '</'+inTag2+'>' + 
					'<'+inTag2+'>' + user.name + '</'+inTag2+'>' + 
					'<'+inTag2+'>' + user.email + '</'+inTag2+'>' + 
					'<'+inTag2+' class = "userRoles rounded droppable" data-uid="'+user.id+'"> ' + @drawRoles(user) + '</'+inTag2+'>' + 
					'</'+inTag + '>')
		$(".droppable").droppable({
			drop: (event, ui)->
				console.log('drop!'+$(this).attr('data-uid'))
		})


	drawRoles: (user)->
		res = ''
		for role in user.roles
			do (role)->
				res += '<span class="draggable badge badge-pill badge-info">'+role.name+'</span>'



			



$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='users' && $('meta[name=psj]').attr('action')=='index'
		users = new Users;
		users.fetch();
		$('.draggable').draggable({
			start: (e, u)->
				console.log('drag start!'+$(this).attr('data-uid'))
			stop: (e, u)->
				console.log('drag stop!'+$(this).attr('data-uid'))

		})
