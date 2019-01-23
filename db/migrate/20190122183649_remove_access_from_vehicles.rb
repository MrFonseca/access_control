class RemoveAccessFromVehicles < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :access, :boolean
  end
end
