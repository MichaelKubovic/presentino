class AddImageUrlToPresents < ActiveRecord::Migration[5.0]
  def change
    change_table :presents do |t|
      t.string :image
    end
  end
end
