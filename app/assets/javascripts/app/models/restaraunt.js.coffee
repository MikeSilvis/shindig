class App.Restaraunt extends Spine.Model
  @configure 'Restaraunt', 'name', 'ls_id', 'address'
  @extend Spine.Model.Ajax

  @url: => "/api/v1/restaraunts"