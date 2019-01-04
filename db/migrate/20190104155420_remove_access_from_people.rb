class RemoveAccessFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :access, :boolean
  end
end
