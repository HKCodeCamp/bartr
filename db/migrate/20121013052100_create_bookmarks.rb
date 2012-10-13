class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user
      t.references :item

      t.timestamps
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :item_id
  end
end
