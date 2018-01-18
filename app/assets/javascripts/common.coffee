window.doFilter = (f, rows)->
	if f.val() != ''
		$('.filters').removeClass('glowing')
		f.addClass('glowing')
		filterRegex =  new RegExp( f.val().toUpperCase() )
		filterField = f.data("filterOn")
		rowsToFilter = rows
		rowsToFilter.each (index, row)->
			field = $(row).find('.'+filterField)
			if filterRegex.test(field.text().toUpperCase()) or filterRegex==""
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

# window.takeDocument = (path,id) ->
# 	alert(path+id)

window.takeUntakeDocument = (type,id) ->
	data = {
		type: type,
		id: id
	}
	App.actionsChannel.takeUntake(data)	

window.handleAddCompany = (e, selects_class, dialog_id)->
	e.preventDefault();
	modal = $('#'+dialog_id)
	company = {
		name: modal.find(".input-name").val()
		address: modal.find(".input-address").val()
		edrpou: modal.find(".input-edrpou").val()
	}
	jqxhr = $.post("/companies.json", {company})
		.done (res)=>
			console.log (res)
			$('.'+selects_class).append("<option selected='selected' value='#{res.id}'>#{res.name} (#{res.edrpou})</option>")
			$('#'+dialog_id).modal( "hide" )
		.fail ( jqXHR, textStatus, errorThrown)=>
			alert ("Помилка: #{jqXHR.statusText} #{jqXHR.responseText}")


$(document).on 'turbolinks:load', ->
	$('.untake-button, .take-button').click( 
		(e)->
			e.preventDefault();
	)

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



