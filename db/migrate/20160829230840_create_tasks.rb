class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.time :estimated_time
      t.time :real_time
      t.references :sprint, foreign_key: true

      t.timestamps
    end
  end
end
