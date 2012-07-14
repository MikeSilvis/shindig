class App.Item extends Spine.Model
  @configure 'Item', 'name', 'category', 'quantity', 'category_id', 'username'
  @extend Spine.Model.Ajax

  @url: => "/api/v1/events/#{scoped_event_id}/items/"