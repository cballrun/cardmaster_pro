class Variant < ApplicationRecord
    has_many :listings
    has_many :sales
  
    validates_presence_of :name
    validates_presence_of :url
  end