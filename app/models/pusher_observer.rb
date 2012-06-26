class PusherObserver < ActiveRecord::Observer
  observe :message, :menu, :attendee

  def after_create(rec)
    publish(:create, rec)
  end

  def after_update(rec)
    publish(:update, rec)
  end

private

  def publish(type, record)
    Pusher['observer'].trigger!(
                                type,
                                {
                                  id: record.id,
                                  class: record.class.name,
                                  record: record
                                },
                                )
  end

end
