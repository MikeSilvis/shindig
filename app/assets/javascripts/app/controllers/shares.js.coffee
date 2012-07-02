class App.Shares extends Spine.Controller

	constructor: ->
		super
		$.getJSON("/api/v1/events/#{scoped_event_id}/tweets.json", @render)
		$("#send_tweet").live 'submit', (e) =>
			e.preventDefault()
			$.post "/api/v1/events/#{scoped_event_id}/tweets",
				content: $("#add_tweet").val()
			$("#add_tweet").val("")
			$("#tweet_success").fadeIn().delay(3000).fadeOut()

	render: (tweeps) =>
		@html @view("share/index")
		$("#add_tweet").typeahead({
      source: tweeps,
    })
    $("#share_link").click ->
    	$(this).select()
    $("#add_tweet").limit "110", "#chars_left"