class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :desc
      t.string :category
      t.float :price
      t.string :status
      t.text :tag
      t.datetime :deleted_at
      t.integer :owner_id

      t.timestamps
    end
  end
end
