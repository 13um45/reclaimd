class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :tops
      t.boolean :bottoms
      t.boolean :outerwear
      t.boolean :shoes
      t.boolean :bags
      t.boolean :jewelry
      t.boolean :mens
      t.boolean :womens
      t.boolean :unisex
      t.boolean :xs
      t.boolean :s
      t.boolean :m
      t.boolean :l
      t.boolean :xl
      t.boolean :obsidian
      t.boolean :onyx
      t.boolean :alabaster
      t.boolean :slate
      t.boolean :heather
      t.boolean :silver
      t.boolean :pattern
      t.integer :quantity
      t.integer :price
      t.string :brand
      t.string :material
      t.text :description

      t.timestamps null: false
    end
  end
end
