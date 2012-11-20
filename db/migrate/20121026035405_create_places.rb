class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.text :desc
      t.integer :owner_id

      t.timestamps
    end
  end
end
