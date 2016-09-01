class AddProjectIdToSprint < ActiveRecord::Migration[5.0]
  def chang
    add_column :sprints, :project_id, :integer
  end
end
