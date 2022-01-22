json.extract! event, :id, :name, :start, :end, :team_id, :created_at, :updated_at
json.url event_url(event, format: :json)
