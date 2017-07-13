$(document).on 'turbolinks:load', ->
	window.listChange = (path)->
	# 	window.location.href = path;
		$.ajax({
			type : "GET",
			url : path,
			complete: ( response, status)->
				$("#data-container").html(response.responseText)
				
		});
