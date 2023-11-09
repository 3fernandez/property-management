class CreatePropertyEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :property_events do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.string :type
      t.json :payload

      t.timestamps
    end
  end
end
