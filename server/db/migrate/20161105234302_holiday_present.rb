class HolidayPresent < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays_presents, id: false do |t|
      t.integer :holiday_id
      t.integer :present_id
    end
    add_index :holidays_presents, :holiday_id #lookup by holiday
    add_index :holidays_presents, :present_id #reverse lookup from present to holiday
  end
end
