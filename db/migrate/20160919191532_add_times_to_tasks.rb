class AddTimesToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :started_in, :datetime
    add_column :tasks, :finished_in, :datetime
  end
end
