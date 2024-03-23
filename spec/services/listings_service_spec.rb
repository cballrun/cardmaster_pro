require "rails_helper"

RSpec.describe ListingsService do
    describe "initialization" do
        
        it 'exists' do
            url = "https://www.tcgplayer.com/product/106996/pokemon-base-set-shadowless-alakazam?page=1"
            listings_service = ListingsService.new(url)

            expect(listings_service).to be_a(ListingsService)
        end
    end
end