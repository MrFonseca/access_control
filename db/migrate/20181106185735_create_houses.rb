class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :number
      t.string :address
      t.text :route
      t.string :status

      t.timestamps
    end
  end
end
