class PushPusher
  @queue = :pusher

  def self.perform(type, rec, klass)
  	PushPusher.publish(type, rec, klass)
  end

private

  def self.publish(type, record, klass)
    Pusher['observer'].trigger!(
                                type,
                                {
                                  id: record["id"],
                                  class: klass,
                                  record: record
                                },
                                )
  end

end