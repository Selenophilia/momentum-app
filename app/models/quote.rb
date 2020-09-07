class Quote < ApplicationRecord
  belongs_to :author

  #validates :description, presence:true  
end
