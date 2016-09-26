class AddValueToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :value, :decimal, precision: 5, scale: 2
  end
end
