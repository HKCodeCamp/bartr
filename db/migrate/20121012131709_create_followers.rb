class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :followed_by_id
      t.integer :following_id

      t.timestamps
    end

    add_index :followers, :following_id
    add_index :followers, :followed_by_id
  end
end
