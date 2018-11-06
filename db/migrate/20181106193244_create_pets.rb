class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :species
      t.string :breed
      t.string :color
      t.string :gender
      t.string :size
      t.boolean :access
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
