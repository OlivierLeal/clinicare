class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
