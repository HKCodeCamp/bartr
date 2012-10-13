class CreateItemPms < ActiveRecord::Migration
  def change
    create_table :item_pms do |t|
      t.references :item
      t.references :sender
      t.text :message

      t.timestamps
    end
    add_index :item_pms, :item_id
    add_index :item_pms, :sender_id
  end
end
