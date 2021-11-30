json.extract! note, :id, :title, :body, :team_id, :created_by_user_id, :created_at, :updated_at
json.url note_url(note, format: :json)
