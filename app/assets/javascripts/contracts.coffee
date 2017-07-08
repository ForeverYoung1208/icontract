# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

	if $('meta[name=psj]').attr('controller')=='contracts'
		window.listChange = (path)->
			window.location.href = path;


			# switch val
			# 	when 'all' 
			# 		$.ajax({
			# 			type : "GET",
			# 			url : "all",
			# 			dataType: 'js',
			# 			contentType: 'application/javascript',
			# 			complete: ( response, status)->
			# 				if status =='success'
			# 					$("#contracts-container").innerHtml = response
			# 				else
			# 					console.log response
			# 		});
			# 	when 'mine' 
			# 		alert 'mineeeeee'
