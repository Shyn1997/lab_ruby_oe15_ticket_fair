class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :trip, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :status_buy
      t.integer :status_cancel
      t.integer :fare
      t.string :bus_stop

      t.timestamps
    end
  end
end
