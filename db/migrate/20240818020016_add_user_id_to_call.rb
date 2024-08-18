class AddUserIdToCall < ActiveRecord::Migration[7.1]
  def change
    add_reference :calls, :user, null: false, foreign_key: true
  end
end
