class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :title
      t.text :description
      t.references :client, null: false, foreign_key: true
      t.integer :status
      t.references :technician, null: false, foreign_key: true
      t.datetime :opened_at

      t.timestamps
    end
  end
end
