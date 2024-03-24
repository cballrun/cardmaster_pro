require "rails_helper"

RSpec.describe ListingsService do
    # describe "initialization" do
        
    #     it 'exists' do
    #         url = "https://www.tcgplayer.com/product/527937/pokemon-trading-card-game-classic-charmeleon?page=1"
    #         listings_service = ListingsService.new(url)

    #         expect(listings_service).to be_a(ListingsService)
    #     end
    # end

    describe "creating listing objects" do
        it 'gets an array of CardListings for a given URL' do
            url = "https://www.tcgplayer.com/product/106996/pokemon-base-set-shadowless-alakazam?page=1"
            listings_service = ListingsService.new(url)
            card_listings = listings_service.scrape_listings
            binding.pry
            expect(card_listings.count).to_not eq(0)
            expect(card_listings.first).to be_a(CardListing)
        end
    end
end