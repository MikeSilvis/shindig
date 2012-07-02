$(document).ready ->
	$("#new_event").submit (e) ->
		e.preventDefault()
		$.cookie("name", $("#event_name").val())
		$.cookie("description", $("#event_description").val())
		$.cookie("street", $("#event_street").val())
		$.cookie("zipcode", $("#event_zipcode").val())
		$('#signUp').modal("show")