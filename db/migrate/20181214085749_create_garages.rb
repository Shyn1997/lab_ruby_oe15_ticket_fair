class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.text :info 
      t.string :image
      
      t.timestamps
    end
  end
end
