class AddCustoToService < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :custo, :float
  end
end
