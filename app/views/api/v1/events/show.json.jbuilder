json.id @event.id
json.name @event.name
json.description @event.description
json.street @event.street
json.city @event.city
json.state @event.state
json.zipcode @event.zipcode
json.created_at @event.created_at
json.updated_at @event.updated_at
json.latitude @event.latitude
json.longitude @event.longitude
json.user @event.user, :name, :username, :avatar, :email
json.user_id @event.user_id
json.url_invite @event.google_url
json.token @event.token