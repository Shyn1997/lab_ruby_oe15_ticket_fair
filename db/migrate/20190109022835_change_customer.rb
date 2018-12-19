class ChangeCustomer < ActiveRecord::Migration[5.2]
  def change
    change_table :customers do |t|
      t.string :bus_stop
    end
  end
end
