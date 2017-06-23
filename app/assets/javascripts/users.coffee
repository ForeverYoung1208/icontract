
class Roles
	constructor:()->
		jqxhr = $.get("roles.json")
			.done (res)=>
				@data = res
	getById: (id)->
		for role in @data
			if role.id.toString() == id
				return role

class Users
	@instances=[]
	constructor: (id, allRoles)->
		@data = []
		@element_id = id
		@constructor.instances<<this
		@allRoles = allRoles

	show: ()->
		jqxhr = $.get("users.json")
			.done (res)=>
				@data = res
				@redrawTo( $(@element_id) ) 
	redrawTo: (el)=>
		inTag1 = el.attr('inTag1')
		inTag2 = el.attr('inTag2')
		for user in @data 
			do (user)=>
				el.append( '<'+inTag1+'>' + 
					'<'+inTag2+'>' + user.id + '</'+inTag2+'>' + 
					'<'+inTag2+'>' + user.name + '</'+inTag2+'>' + 
					'<'+inTag2+'>' + user.email + '</'+inTag2+'>' + 
					'<'+inTag2+' class = "userRoles rounded droppable" data-uid="'+user.id+'"> Querying roles.... </'+inTag2+'>' + 
					'</'+inTag1 + '>')
		@drawRolesforUsers(@data)
		@setDropRoleActions(el)
	setDropRoleActions: (el)=>
		self = this
		el.find(".droppable").droppable({
			drop: (event, ui)->
				uid = $(this).attr('data-uid')
				rid = ui.draggable.attr('data-rid')
				for user in self.data
					if user.id.toString() == uid 
						user.roles.push( rid ) if not (rid in user.roles)
						self.drawRolesforUsers([user])
		})
	drawRolesforUsers: (users)->
		res = ''
		for user in users
			res = ''
			for role_id in user.roles
				res += '<span class="badge badge-pill badge-info" data-rid="'+role_id+'" data-uid="'+user.id+'" >'+role_id+' ' +@allRoles.getById(role_id).name 
				res += ' <i class="fa fa-2x fa-trash deletable"></i>'
				res += '</span>'					
			$(@element_id).find("[data-uid='" + user.id + "']").html( res )
			$('.draggable').draggable(
				helper: 'clone'
			)
	deleteRoleFromUser: (role_id, user_id) =>
		for user in @data
			if user.id.toString() == user_id
				i = user.roles.indexOf(role_id)
				user.roles.splice(i,1) if i > 0

				



		


$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='users' && $('meta[name=psj]').attr('action')=='index'
		allRoles = new Roles
		allUsers = new Users('#ajaxUsers', allRoles);
		allUsers.show();
		$('.draggable').draggable(
			helper: 'clone'
		)
		$('.area.droppable').droppable(
			drop: (event, ui) ->
				alert('dropped!!! user:'+ ui.draggable.attr('data-uid')+', role: '+ ui.draggable.attr('data-rid') )
		)
		
