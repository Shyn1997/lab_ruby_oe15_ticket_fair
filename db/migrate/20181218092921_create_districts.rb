class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :types
      t.references :city, forgeign_key: true
    end
  end
end
