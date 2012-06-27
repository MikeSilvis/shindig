Share = App.Share

class App.Share extends Spine.Controller

	constructor: ->
		super
		@render()

	render: =>
		@html @view("share/index")