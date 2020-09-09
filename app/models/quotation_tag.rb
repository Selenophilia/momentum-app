class QuotationTag < ApplicationRecord
    
    belongs_to :quote
    belongs_to :tag
    validates  :tag_id, 
               presence: true 
    validates  :quote_id, 
               presence: true


end
