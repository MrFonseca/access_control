class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :document
      t.string :phone
      t.boolean :access
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
