class PusherObserver < ActiveRecord::Observer
  observe :message, :menu, :attendee

  def after_create(rec)
    Resque.enqueue(PushPusher, :update, rec, rec.class.name)
  end

  def after_update(rec)
    Resque.enqueue(PushPusher, :update, rec, rec.class.name)
  end

end
