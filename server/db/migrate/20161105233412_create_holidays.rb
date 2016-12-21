class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.string :label, null: false
      t.date :date_from
      t.date :date_to
      t.timestamps
    end
    add_index :holidays, :label
    add_index :holidays, :updated_at
  end
end
