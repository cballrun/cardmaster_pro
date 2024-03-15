require "rails_helper"

RSpec.describe SalesService do
    describe "initialization" do
        it 'exists' do
            sales_service = SalesService.new("https://www.tcgplayer.com/product/42360/pokemon-base-set-blastoise?xid=pifeb125a6-e2c2-4058-a4dc-9d9615b0ca2e&page=1&Language=English")
            
            expect(sales_service).to be_a(SalesService)
        end
    end
end