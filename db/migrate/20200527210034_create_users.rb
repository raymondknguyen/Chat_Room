class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :street_address
      t.string :state
      t.string :zip
      t.string :profile_picture
      t.string :phone_number
      t.integer :age
      t.string :about_me

      t.timestamps
    end
  end
end
