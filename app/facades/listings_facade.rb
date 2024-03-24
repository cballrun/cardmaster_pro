class ListingsFacade
    
    def self.listings_by_variant_url(url)
        listings_service = ListingsService.new(url)
        variant = Variant.find_by(url: url)
        listings_array = listings_service.scrape_listings
        listings_array.each do |listing|
            condition = listing.condition
            price = listing.price
            seller = listing.seller

            Listing.create(variant_id: variant.id, condition: condition, price: price, seller: seller)
        end
    end
end