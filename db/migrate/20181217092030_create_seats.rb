class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :code
      t.integer :types
      t.references :coach, forgein_key: true

      t.timestamps
    end
  end
end
