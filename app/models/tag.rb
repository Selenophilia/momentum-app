class Tag < ApplicationRecord

    has_many  :quotation_tags
    has_many  :quotes,:through =>  :quotation_tags   
    accepts_nested_attributes_for :quotes, allow_destroy: true
    accepts_nested_attributes_for :quotation_tags

    validates :name, presence: true, 
              length: {minimum: 4}
    
    validates_associated :quotes          
    validates_associated :quotation_tags          

    # validates_presence_of :quotes          
    # validates_presence_of :quotation_tags          


end
