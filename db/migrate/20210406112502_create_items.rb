class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.integer :condition_id
      t.integer :shipping_free_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :category_id
      t.references :user
      t.timestamps
    end
  end
end
