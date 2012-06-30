json.id message.id
json.event_id message.id
json.content message.content
json.created_at time_ago_in_words(message.created_at)
json.user message.user, :name, :username, :avatar, :email