class Tag < ApplicationRecord
    has_many  :quotation_tags, dependent: :destroy
    has_many  :quotes,:through =>  :quotation_tags   
    
    #accepts_nested_attributes_for :quotes, allow_destroy: true
    #accepts_nested_attributes_for :quotation_tags

    validates :name, presence: true, 
              length: {minimum: 4}
    
end
