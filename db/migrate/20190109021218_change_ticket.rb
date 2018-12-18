class ChangeTicket < ActiveRecord::Migration[5.2]
  def change
    change_table :tickets do |t|
      t.string :code
    end
  end
end
