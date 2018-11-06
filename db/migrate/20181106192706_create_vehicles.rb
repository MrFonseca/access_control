class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.string :color
      t.integer :year
      t.boolean :access
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
