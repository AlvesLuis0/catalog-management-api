class RenameNameToTitleInCategories < ActiveRecord::Migration[8.0]
  def change
    rename_column :categories, :name, :title
  end
end
