require 'rails_helper'

RSpec.describe SalesFacade do

    it 'gets an array of cards when there are cards available' do
        card_link = "https://www.tcgplayer.com/product/89386/pokemon-legendary-collection-snorlax?xid=pica3a2f31-e64a-4c7f-8325-463bb018a3f5&page=1&Language=English"
        sales_array = SalesFacade.sales_by_card_link(card_link)
        
        expect(sales_array).to be_a(Array)
    end
end