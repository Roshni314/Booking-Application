class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :capacity
      t.string :address
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
