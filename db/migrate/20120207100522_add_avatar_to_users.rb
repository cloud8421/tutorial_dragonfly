class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_image_uid, :string
    add_index :users, :avatar_image_uid

    add_column :users, :avatar_image_name, :string

  end
end
