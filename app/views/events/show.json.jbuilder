json.id @event.id
json.name @event.name
json.description @event.description
json.street @event.street
json.city @event.city
json.state @event.state
json.created_at @event.created_at
json.updated_at @event.updated_at
json.user @event.user, :name, :username, :avatar, :email