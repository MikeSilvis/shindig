class PusherObserver < ActiveRecord::Observer
  observe :message, :menu, :attendee, :possible_time

  def after_create(rec)
  	publish(:update, rec)
  end

  def after_update(rec)
  	publish(:update, rec)
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
