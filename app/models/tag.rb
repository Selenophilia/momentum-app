class Tag < ApplicationRecord

    validates :tag_id, presence: true 

    validates :quotation_id, presence: true
        
end
