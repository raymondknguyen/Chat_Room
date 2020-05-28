class CreateGearItems < ActiveRecord::Migration[5.2]
  def change
    create_table :gear_items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :condition
      t.integer :status, default: 0
      t.string :location

      t.timestamps
    end
  end
end
