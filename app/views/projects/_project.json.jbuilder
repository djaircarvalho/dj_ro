json.extract! project, :id, :name, :opening_date, :closing_date, :expected_value, :created_at, :updated_at, :user_ids
json.url project_url(project, format: :json)
