class Author < ApplicationRecord
    has_many :quote, dependent: :destroy

    validates :author_name, presence:true  
    validates :author_name, uniqueness:true
end
