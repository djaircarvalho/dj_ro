json.extract! task, :id, :title, :description, :estimated_time, :time_spent, :status, :sprint_id, :created_at, :updated_at
json.url task_url(task, format: :json)
