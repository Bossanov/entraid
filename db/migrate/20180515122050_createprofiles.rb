class Createprofiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :job, null: false
      t.string :city, null: false
      t.string :photo
      t.date :birthday, null: false
      t.string :phone_number, null: false
      t.string :statut , default: "no"
      t.timestamps
    end
  end
end
