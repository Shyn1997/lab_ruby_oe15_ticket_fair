class ChangeCustomer2 < ActiveRecord::Migration[5.2]
  def change
    change_table :customers do |t|
      t.remove :email
      t.string :email, allow_nil: true
    end
  end
end
