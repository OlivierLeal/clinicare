class AddGroupToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :group, :integer
  end
end
