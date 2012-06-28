Share = App.Share

class App.Share extends Spine.Controller

	events:
		'submit' : "tweetTweeps"

	constructor: ->
		super
		$.getJSON "/events/#{scoped_event_id}/tweets.json", @render

	render: (tweeps) =>
		@html @view("share/index")
		$("#add_tweet").typeahead({
      source: tweeps,
    })
    $("#add_tweet").limit "110", "#chars_left"

  tweetTweeps: (e) =>
  	@log "heyo"
  	e.preventDefault()
  	# $.post "/events/#{scoped_event_id}/tweets", ->
	  # 	$("#add_tweet").val()


