class ChangeDescriptionToTextInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :description, :text, :limit => nil
  end
end
