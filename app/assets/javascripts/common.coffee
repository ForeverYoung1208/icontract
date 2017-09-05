$(document).on 'turbolinks:load', ->
	window.listChange = (path)->
		window.location.href = path;
		# fuck the ajax here
		# $.ajax({
		# 	type : "GET",
		# 	url : path,
		# 	complete: ( response, status)->
		# 		$("#data-container").html(response.responseText)
				
		# });
	$('[data-toggle="tooltip"]').tooltip()
	$('input[type=file]').bootstrapFileInput();
	$('.file-inputs').bootstrapFileInput();
