class CreatePresents < ActiveRecord::Migration[5.0]
  def change
    create_table :presents do |t|
      t.string :label, null: false
      t.numeric :price, null: false
      t.string :sex, null: false, length: 1
      t.integer :age_from, null: false
      t.integer :age_to, null: false
      t.text :description
      t.boolean :ml_generated
      t.timestamps
    end
    add_index :presents, :label
    add_index :presents, :price
  end
end
