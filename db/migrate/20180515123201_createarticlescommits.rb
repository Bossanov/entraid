class Createarticlescommits < ActiveRecord::Migration[5.1]
  def change
    create_table :articlecommits do |t|
      t.text :content, null: false
      t.string :autor
      t.string :statut, default: "no"
      t.timestamps
    end
  end
end
