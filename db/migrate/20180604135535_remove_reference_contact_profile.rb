class RemoveReferenceContactProfile < ActiveRecord::Migration[5.1]
  def change
    remove_reference :contacts, :profile, foreign_key: true, index: true

  end
end
