class AddPhotoToGearItems < ActiveRecord::Migration[5.2]
  def change
    add_column :gear_items, :photo, :string
  end
end
