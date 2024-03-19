require "rails_helper"

RSpec.describe SalesService do
    describe "initialization" do
        it 'exists' do
            sales_service = SalesService.new("https://www.tcgplayer.com/product/42360/pokemon-base-set-blastoise?xid=pifeb125a6-e2c2-4058-a4dc-9d9615b0ca2e&page=1&Language=English")
            
            expect(sales_service).to be_a(SalesService)
        end
    end

    # describe "navigation" do
    #     it "is able to navigate to the given card link" do
    #         # sales_service = SalesService.new("https://www.tcgplayer.com/product/89386/pokemon-legendary-collection-snorlax?xid=pica3a2f31-e64a-4c7f-8325-463bb018a3f5&page=1&Language=English")
        
    #         expect(current_path).to eq("https://www.tcgplayer.com/product/89386/pokemon-legendary-collection-snorlax?xid=pica3a2f31-e64a-4c7f-8325-463bb018a3f5&page=1&Language=English")
    #     end
    # end

    # describe "scraping sales" do
    #     it "is able to click the view more data button until all sales are loaded" do
    #         sales_service = SalesService.new("https://www.tcgplayer.com/product/42360/pokemon-base-set-blastoise?xid=pifeb125a6-e2c2-4058-a4dc-9d9615b0ca2e&page=1&Language=English")

    #     end

    # end
end