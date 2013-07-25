class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
