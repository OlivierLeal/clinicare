class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.references :call, null: false, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
