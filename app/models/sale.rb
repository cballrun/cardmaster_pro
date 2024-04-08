class Sale < ApplicationRecord
    belongs_to :variant
  
    validates_presence_of :date
    validates_presence_of :condition
    validates_presence_of :quantity
    validates_presence_of :price
  end