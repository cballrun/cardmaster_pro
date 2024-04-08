class Listing < ApplicationRecord
    belongs_to :variant
  
    validates_presence_of :condition
    validates_presence_of :seller
    validates_presence_of :price
  end