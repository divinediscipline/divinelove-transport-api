class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :num_plate
      t.string :manufacturer
      t.string :model
      t.date :year
      t.integer :capacity
      t.string :color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
