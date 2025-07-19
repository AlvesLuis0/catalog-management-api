class AddNameToOwners < ActiveRecord::Migration[8.0]
  def change
    add_column :owners, :name, :string, limit: 60
    change_column_null :owners, :name, false, '<UNDEFINED>'
  end
end
