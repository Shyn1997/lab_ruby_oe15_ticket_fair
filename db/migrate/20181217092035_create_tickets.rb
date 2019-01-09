class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :trip, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :status, default: 2
      t.string :code
      t.references :seat, foreign_key: true
      t.string :bus_stop

      t.timestamps
    end
  end
end
