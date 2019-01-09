class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :time_start
      t.datetime :time_finish
      t.string :city_start
      t.string :city_finish
      t.references :coach, foreign_key: true
      t.boolean :is_repeated
      t.float :fare

      t.timestamps
    end
  end
end
