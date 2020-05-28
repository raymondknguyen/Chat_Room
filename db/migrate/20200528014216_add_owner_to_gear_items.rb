class AddOwnerToGearItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :gear_items, :owner, foreign_key: true
  end
end
