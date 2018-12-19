class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :trip, foreign_key: true
      t.integer :customer_id
      t.integer :status
      t.references :seat, foreign_key: true

      t.timestamps
    end
  end
end
