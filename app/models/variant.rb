class Variant < ApplicationRecord
    has_many :listings
    has_many :sales
  
    validates_presence_of :name
    validates_presence_of :url
    validates_presence_of :tcgplayerid

    def self.find_variant_by_url(url)
      Variant.find_by(url: url)
    end
  end