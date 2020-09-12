class Tag < ApplicationRecord
    has_many  :quotation_tags, dependent: :destroy
    has_many  :quotes,:through =>  :quotation_tags   
    
    validates :name, presence: true, 
              length: {minimum: 4}
    
end
