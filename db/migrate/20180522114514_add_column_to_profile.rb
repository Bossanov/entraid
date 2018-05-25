class AddColumnToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :pseudo, :string, null: false

  end
end
