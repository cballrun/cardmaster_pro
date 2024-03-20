class VariantsFacade
    
    def self.variants_by_search_term(search_term)
        variants_service = VariantsService.new(search_term)
        variants_array = variants_service.scrape_variants
        binding.pry
        variants_array.each do |variant|
            link = variant.find_element(:css, "a")&.attribute("href") 
            set = safe_find_element(variant, "h4")&.text
            name = safe_find_element(variant, "span.search-result__title")&.text
            rarity = safe_find_element(variant, "section.search-result__rarity")&.text
            count = safe_find_element(variant, "span.inventory__listing-count.inventory__listing-count-block")&.text
            low = safe_find_element(variant, "span.inventory__price")&.text
            market = safe_find_element(variant, "span.search-result__market-price--value")&.text
            tcgplayerid = extract_tcgplayerid(link)
            binding.pry
        end
    end

    private 

    def safe_find_element(variant, css_selector)
        begin
            element = @driver.find_element(css: css_selector)
        rescue Selenium::WebDriver::Error::NoSuchElementError
            element = nil
        end
        element
    end

    def extract_tcgplayerid(url)
        match = url.match(/xid=([^&]+)/)
        match ? match[1] : nil
    end
end