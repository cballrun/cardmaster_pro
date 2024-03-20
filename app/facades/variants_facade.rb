class VariantsFacade
    
    def self.variants_by_search_term(search_term)
        variants_service = VariantsService.new(search_term)
        variants_array = variants_service.scrape_variants
        variants_array.map do |variant|
            Variant.new(url: variant.url, set: variant.set, name: variant.name, rarity: variant.rarity, listing_count: variant.count, low_price: variant.low, market_price: variant.market, tcgplayerid: variant.tcgplayerid)
        end
    end
end