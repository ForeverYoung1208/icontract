window.doFilter = (f, rows)->
	if f.val() != ''
		$('.filters').removeClass('glowing')
		f.addClass('glowing')
		filterRegex =  new RegExp( f.val() )
		filterField = f.data("filterOn")
		rowsToFilter = rows
		rowsToFilter.each (index, row)->
			field = $(row).find('.'+filterField)
			if filterRegex.test(field.text())
				$(row).show()
			else
				$(row).hide()
				
window.listChange = (path)->
	window.location.href = path;
# fuck the ajax here
# $.ajax({
# 	type : "GET",
# 	url : path,
# 	complete: ( response, status)->
# 		$("#data-container").html(response.responseText)
		
# });


$(document).on 'turbolinks:load', ->
	$('[data-toggle="tooltip"]').tooltip()
	$('input[type=file]').bootstrapFileInput();
	$('.file-inputs').bootstrapFileInput();
	$('.datepicker').datepicker({
		format: "dd.mm.yyyy",
		todayBtn: "linked",
		clearBtn: true,
		autoclose: true,
		todayHighlight: true,		
		language: "ua",
		orientation: "bottom right"
	});

	$("#dialog-mail-delivery-failed").dialog
		resizable: false
		autoOpen: false
		height: "auto"
		width: 400
		modal: true
		dialogClass: "no-close"
		hide: 
			effect: "fade"
			duration: 500
		show: 
			effect: "fade"
			duration: 500
		buttons:
			"Ok": ()->
				$( this ).dialog( "close" );



