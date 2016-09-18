class ChangeTasksRealTimeToTimeSpent < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :real_time, :time_spent
  end
end
