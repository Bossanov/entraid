class AddDestToNotifications < ActiveRecord::Migration[6.1]
  def change

    add_column :notifications, :dest, :string


  end
end
