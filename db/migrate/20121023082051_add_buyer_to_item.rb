class AddBuyerToItem < ActiveRecord::Migration
  def change
    add_column :items, :buyer_id, :integer

    add_index :items, :buyer_id
  end
end
