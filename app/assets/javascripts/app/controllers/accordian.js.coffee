class @App.Accordian extends Spine.Controller
	SERVICES = ["#times", "#food", "#items", "#messages", "#share"]

	constructor: ->
	  @hideAllTheThings()
	  @toggleAccordian()

	hideAllTheThings: =>
		$(".accordianable").hide()
		$("#times").show()
		$("#times_pointer").addClass("active")

	@continue: (current) =>
		next = SERVICES[SERVICES.indexOf(current) + 1]
		$("#{next}_pointer").click()

	toggleAccordian: =>
		for service in SERVICES
			$("#{service}_pointer").hover (->
			  $(this).addClass("selectable_helpers")  unless $(this).hasClass("active")
				), ->
			  $(this).removeClass("selectable_helpers")  unless $(this).hasClass("active")
			$("#{service}_pointer").click (e) ->
				if ($(e.target).hasClass("continue") == false)
					unless $(this).hasClass("active")
						for service_hide in SERVICES
							$("#{service_hide}").slideUp('slow')
							$("#{service_hide}_pointer").removeClass("active")
						$(this).find(".accordianable").slideDown("slow")
						$("#message_container").scrollTop(11000) ## Shitty temp hack for messages
						$(this).addClass("active").removeClass("selectable_helpers")