class DropQuotationTag < ActiveRecord::Migration[6.0]
  def change
    drop_table :quotation_tags
  end
end
