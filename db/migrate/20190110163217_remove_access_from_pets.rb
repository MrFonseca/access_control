class RemoveAccessFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :access, :boolean
  end
end
