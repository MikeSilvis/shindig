json.array!(@menus) do |json, menu|
  json.partial! menu
end