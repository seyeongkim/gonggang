json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :user_id, :content
  json.url schedule_url(schedule, format: :json)
end
