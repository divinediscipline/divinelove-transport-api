class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.datetime :trip_date
      t.integer :fare
      t.string :status, default: "active"
      t.references :user, foreign_key: true
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
