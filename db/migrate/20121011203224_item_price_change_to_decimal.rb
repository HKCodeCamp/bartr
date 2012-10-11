class ItemPriceChangeToDecimal < ActiveRecord::Migration
  def up
  end
    change_column :items, :price, :decimal, :precision => 11, :scale => 2
  def down
    change_column :items, :price, :float;
  end
end
