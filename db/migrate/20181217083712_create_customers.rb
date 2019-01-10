class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :email, allow_nil: true
      t.string :bus_stop

      t.timestamps
    end
  end
end
