class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.belongs_to :owner, null: false, foreign_key: true
      t.string :name, null: false, limit: 60

      t.timestamps
    end
  end
end
