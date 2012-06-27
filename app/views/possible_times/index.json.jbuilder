json.array!(@possible_times) do |json, possible_time|
  json.partial! possible_time
end