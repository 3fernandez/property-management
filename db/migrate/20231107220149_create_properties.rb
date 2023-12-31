class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :location
      t.decimal :price, precision: 5, scale: 2
      t.integer :status
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
