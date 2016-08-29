class CreateSprints < ActiveRecord::Migration[5.0]
  def change
    create_table :sprints do |t|
      t.string :name
      t.date :opening_date
      t.date :closing_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
