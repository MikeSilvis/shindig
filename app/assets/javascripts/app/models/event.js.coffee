class @App.Event extends Spine.Model
  @configure 'Event', 'city', 'description', 'name', 'state', 'street', 'zipcode', 'created_at', 'updated_at'
  @hasMany 'messages', "Message"

  @extend Spine.Model.Ajax

  @url: => "/api/v1/events/"