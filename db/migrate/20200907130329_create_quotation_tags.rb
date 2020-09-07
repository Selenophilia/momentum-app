class CreateQuotationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_tags do |t|

      t.timestamps
    end
  end
end
