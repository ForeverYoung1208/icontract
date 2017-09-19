# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# test

doFilter = (f, rows)->
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


$(document).on 'turbolinks:load', ->
	if $('meta[name=psj]').attr('controller')=='contracts' && ["index", "all","mine"].indexOf($('meta[name=psj]').attr('action')) > 0
		$('.filters').on 'keyup', ->
			doFilter( $(this), $('#contracts-table tbody tr'))

