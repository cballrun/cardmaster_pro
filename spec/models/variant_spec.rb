require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'relationships' do
    it { should have_many :listings }
    it { should have_many :sales }
  end 

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:tcgplayerid) }
    #other fields are not always present on a Variant and thus aren't validated
  end

  describe '#find_variant_by_url' do
    it 'can find a variant from the database using a url' do
      url = "https://www.tcgplayer.com/product/106996/pokemon-base-set-shadowless-alakazam?page=1"
      variant = Variant.create(url: url, name: "Alakazam", listing_count: "35 listings from", low_price: "$25.08", market_price: "$438.50", tcgplayerid: "106996", set: "Base Set (Shadowless)", rarity: "Holo Rare · #001/102")
      found_variant = Variant.find_variant_by_url(url)

      expect(found_variant).to eq(variant)
    end
  end
end