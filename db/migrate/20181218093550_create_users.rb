class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone_number
      t.boolean :admin
      t.references :garage, foreign_key: true
      
      t.timestamps
    end
  end
end
