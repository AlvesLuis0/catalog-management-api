class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title, null: false, limit: 60
      t.text :description
      t.decimal :price, null: false, precision: 14, scale: 2
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
