class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :contract_type
      t.string :work_days
      t.date :enter_date
      t.date :leave_date
      t.references :house, foreign_key: true
      t.references :person, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
