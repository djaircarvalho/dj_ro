class ChangeEstimatedTimeAndTimeSpentToIntegerInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :estimated_time, :integer
    change_column :tasks, :time_spent, :integer
  end
end
