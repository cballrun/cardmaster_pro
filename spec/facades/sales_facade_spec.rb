require 'rails_helper'

RSpec.describe SalesFacade do

    # it 'gets an array of sales from a card link' do
    #     url = "https://www.tcgplayer.com/product/106996/pokemon-base-set-shadowless-alakazam?page=1"
    #     variant = Variant.create(url: url, name: "Alakazam", listing_count: "35 listings from", low_price: "$25.08", market_price: "$438.50", tcgplayerid: "106996", set: "Base Set (Shadowless)", rarity: "Holo Rare · #001/102")
    #     sales_array = SalesFacade.sales_by_variant_url(url)
    #     first_sale = Sale.first
      
    #     expect(sales_array).to be_a(Array)
    #     expect(Sale.count).to_not eq(0)
    #     expect(first_sale.date).to be_a(String)
    #     expect(first_sale.condition).to be_a(String)
    #     expect(first_sale.quantity.to_i).to be_a(Integer)
    #     expect(first_sale.price).to be_a(String)
    #     expect(first_sale.variant).to eq(variant)
    # end
end