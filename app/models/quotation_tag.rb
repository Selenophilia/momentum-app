class QuotationTag < ApplicationRecord
  belongs_to :quote
  belongs_to :tag
  accepts_nested_attributes_for :tag
  accepts_nested_attributes_for :quote

  validates :quote_id, presence:true  
  validates :tag_id, presence:true

  # validates_presence_of :quote
  # validates_presence_of :tag
   
end
