class AddGeocoder < ActiveRecord::Migration
  def change
    add_column :items, :address, :text, :null => true
    add_column :items, :latitude, :float, :null => true
    add_column :items, :longitude, :float, :null => true
  end
end
