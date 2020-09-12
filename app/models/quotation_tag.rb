class QuotationTag < ApplicationRecord
  belongs_to :quote
  belongs_to :tag
end
