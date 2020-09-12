class Quote < ApplicationRecord
  belongs_to :author
  has_many :quotation_tags
  has_many :tags,:through => :quotation_tags, dependent: :destroy   
  
end
