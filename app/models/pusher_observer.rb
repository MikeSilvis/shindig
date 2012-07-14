class PusherObserver < ActiveRecord::Observer
  observe :message, :menu, :attendee, :possible_time, :possible_attendee, :item

  def after_create(rec)
    publish(rec.event_id, rec)
  end

  def after_update(rec)
    publish(rec.event_id, rec)
  end

  def publish(type, record)
    Pusher['observer'].trigger!(
                                type,
                                    {
                                      id: record["id"],
                                      class: record.class.name,
                                      record: record
                                    },
                                )
  end

end
