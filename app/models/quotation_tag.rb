class QuotationTag < ApplicationRecord
    
    validates :tag_id, presence: true 

    validates :quotation_id, presence: true

end
