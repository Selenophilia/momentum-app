class AddTagsQuotesIdQuotionationTag < ActiveRecord::Migration[6.0]
  def change
    rename_column :quotation_tags,:quotes_id, :quote_id
    rename_column :quotation_tags, :tags_id,:tag_id
  end
end
