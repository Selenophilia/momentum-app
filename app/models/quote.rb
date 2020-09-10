class Quote < ApplicationRecord
  belongs_to :author
  has_many :quotation_tags
  has_many :tags,:through => :quotation_tags   
  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :quotation_tags

  validates_associated :quotation_tags          
  validates_associated :tags

  # validates_presence_of :quotation_tags          
  # validates_presence_of :tags


end
