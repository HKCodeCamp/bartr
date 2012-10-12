class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end

    add_index :followings, :follower_id
    add_index :followings, :following_id
  end
end
