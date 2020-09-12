class AddForeignKeyQuotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :quotes, :tags_id, :integer
  end
end
