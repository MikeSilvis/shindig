class ParamsFinder

  constructor: ->
    @url = window.location.href

  id: =>
    @url.substring(@url.lastIndexOf('/') + 1)

window.ParamsFinder = ParamsFinder