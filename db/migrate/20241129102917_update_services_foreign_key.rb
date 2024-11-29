class UpdateServicesForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :services, :calls
    add_foreign_key :services, :calls, on_delete: :cascade
  end
end
