$(document).on 'turbolinks:load', ->
	window.listChange = (page, state)->
	# 	window.location.href = path;

		switch page
			when 'contracts'
				$.ajax({
					type : "GET",
					url : path,
					complete: ( response, status)->
						$("#contracts-container").html(response.responseText)
						
				});
			when 'akts'
				$.ajax({
					type : "GET",
					url : path,
					complete: ( response, status)->
						$("#contracts-container").html(response.responseText)
						
				});

