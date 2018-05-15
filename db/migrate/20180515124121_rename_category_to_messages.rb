class RenameCategoryToMessages < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :category, :theme
  end
end
