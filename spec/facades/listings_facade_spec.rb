require 'rails_helper'

RSpec.describe ListingsFacade do

    # it 'creates an array of listings from a card link and associates the listings with the right variant' do
    #     url = "https://www.tcgplayer.com/product/106996/pokemon-base-set-shadowless-alakazam?page=1"
    #     variant = Variant.create(url: url, name: "Alakazam", listing_count: "35 listings from", low_price: "$25.08", market_price: "$438.50", tcgplayerid: "106996", set: "Base Set (Shadowless)", rarity: "Holo Rare · #001/102")
    #     listings_array = ListingsFacade.listings_by_variant_url(url)
    #     first_listing = listings_array.first
        
    #     expect(listings_array).to be_a(Array)
    #     expect(Listing.count).to_not eq(0)
    #     expect(first_listing.variant).to eq(variant)
    #     expect(first_listing.condition).to be_a(String)
    #     expect(first_listing.seller).to be_a(String)
    #     expect(first_listing.price).to be_a(String)
    # end
end