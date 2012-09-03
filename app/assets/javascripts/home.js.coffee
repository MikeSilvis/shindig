$(document).ready ->
	$("#new_event").submit (e) ->
		e.preventDefault()
		if ($("#event_name").val().length > 0) and ($("#event_description").val().length > 0) and ($("#event_street").val().length > 0) and ($("#event_zipcode").val().length > 0)
			$.cookie("name", $("#event_name").val())
			$.cookie("description", $("#event_description").val())
			$.cookie("street", $("#event_street").val())
			$.cookie("zipcode", $("#event_zipcode").val())
			$('#signUp').modal("show")
jQuery ->
  $(".carousel").carousel interval: 3000 if $(".carousel")