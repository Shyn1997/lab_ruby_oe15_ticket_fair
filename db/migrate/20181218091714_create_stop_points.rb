class CreateStopPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :stop_points do |t|
      t.time :time_stop
      t.integer :types
      t.references :trip, foreign_key: true
      t.references :bus_station, foreign_key: true

      t.timestamps
    end
  end
end
