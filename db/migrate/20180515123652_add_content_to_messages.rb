class AddContentToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :content, :text
    change_column :messages, :category, :string
  end
end
