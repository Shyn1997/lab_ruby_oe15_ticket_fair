class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :license_plate
      t.string :types
      t.integer :seat_amount
      t.integer :seat_form
      t.references :garage, foreign_key: true
      t.timestamps
    end
  end
end
