class Tag < ApplicationRecord

    has_many :quotation_tag
    has_many :quote, through: :quotation_tag   
    validates :name, presence: true, 
    length: {minimum: 4}

end
