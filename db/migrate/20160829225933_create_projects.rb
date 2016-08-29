class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :opening_date
      t.date :closing_date
      t.decimal :expected_value, precision: 5, scale: 2

      t.timestamps
    end
  end
end
