class PusherObserver < ActiveRecord::Observer
  observe :message

  def after_create(rec)
    publish(:create, rec)
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
