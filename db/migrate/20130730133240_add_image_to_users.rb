class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :attachment
    add_column :users, :profile, :text
  end
end
