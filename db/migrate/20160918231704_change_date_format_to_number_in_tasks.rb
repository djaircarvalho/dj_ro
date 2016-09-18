class ChangeDateFormatToNumberInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :estimated_time, :decimal, precision: 5, scale: 2
    change_column :tasks, :time_spent, :decimal, precision: 5, scale: 2
  end
end
