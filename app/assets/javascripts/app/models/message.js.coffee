class App.Message extends Spine.Model
  @configure 'Message', 'event_id', 'content', 'user_id'
  @belongsTo 'event', "Event"

  @extend Spine.Model.Ajax