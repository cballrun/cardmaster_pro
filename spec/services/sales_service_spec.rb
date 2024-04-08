require "rails_helper"

RSpec.describe SalesService do
    describe "initialization" do
        # it 'exists' do
        #     sales_service = SalesService.new("https://www.tcgplayer.com/product/42360/pokemon-base-set-blastoise?xid=pifeb125a6-e2c2-4058-a4dc-9d9615b0ca2e&page=1&Language=English")
            
        #     expect(sales_service).to be_a(SalesService)
        # end
    end

    describe "navigation" do
        # it "is able to navigate to the given card link" do
            # sales_service = SalesService.new("https://www.tcgplayer.com/product/89386/pokemon-legendary-collection-snorlax?xid=pica3a2f31-e64a-4c7f-8325-463bb018a3f5&page=1&Language=English")
        
            # expect(@driver.current_path).to eq("https://www.tcgplayer.com/product/89386/pokemon-legendary-collection-snorlax?xid=pica3a2f31-e64a-4c7f-8325-463bb018a3f5&page=1&Language=English")
        # end
    end

    describe "scraping sales" do
        # it "is able to return an array of all available sales data" do
        #     card_link = "https://www.tcgplayer.com/product/106997/pokemon-base-set-shadowless-blastoise?page=1"
        #     sales_service = SalesService.new(card_link)
        #     sales_array = sales_service.scrape_sales
        #     most_recent_sale = sales_array.first
     
        #     expect(sales_array).to be_a(Array)
        #     expect(sales_array.count).to_not eq(0)
        #     expect(most_recent_sale.find_element(:css, "span.date")&.text).to be_a(String)
        #     expect(most_recent_sale.find_element(:css, "span.condition")&.text).to be_a(String)
        #     expect(most_recent_sale.find_element(:css, "span.quantity")&.text).to be_a(String)
        #     expect(most_recent_sale.find_element(:css, "span.price")&.text).to be_a(String)
        # end
    end
end