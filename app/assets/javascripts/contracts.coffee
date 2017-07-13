# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# test

$(document).on 'turbolinks:load', ->

	if $('meta[name=psj]').attr('controller')=='contracts'
		window.listChange = (path)->
		# 	window.location.href = path;
			$.ajax({
				type : "GET",
				url : path,
				complete: ( response, status)->
					$("#contracts-container").html(response.responseText)
					
			});
