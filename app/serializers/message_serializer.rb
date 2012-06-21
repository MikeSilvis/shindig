class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :event_id, :user_id
end
