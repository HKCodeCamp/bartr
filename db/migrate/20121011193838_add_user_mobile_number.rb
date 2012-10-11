class AddUserMobileNumber < ActiveRecord::Migration
  def up
    add_column :users, :mobile_no, :string, :default => ""
  end

  def down
    remove_column :users, :mobile_no
  end
end