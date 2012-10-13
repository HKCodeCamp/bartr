class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user
      t.references :item
      t.integer :status, :null => false, :default => 0

      t.timestamps
    end
    add_index :interests, :user_id
    add_index :interests, :item_id
    add_index :interests, :status
  end
end
