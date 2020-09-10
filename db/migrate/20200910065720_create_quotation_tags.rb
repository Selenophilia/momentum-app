class CreateQuotationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_tags do |t|
      t.references :quote, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
