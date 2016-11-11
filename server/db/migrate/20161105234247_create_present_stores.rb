class CreatePresentStores < ActiveRecord::Migration[5.0]
  def change
    create_table :present_stores do |t|
      t.integer :present_id
      t.numeric :price, null: false
      t.string :url, null: false
      t.timestamps
    end
    add_index :present_stores, :present_id
    add_index :present_stores, :price
  end
end
