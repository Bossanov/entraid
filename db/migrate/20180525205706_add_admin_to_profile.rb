class AddAdminToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :admin, :string, null: false, default: "no"

  end
end
