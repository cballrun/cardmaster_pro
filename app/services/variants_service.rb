require "selenium-webdriver"
require "uri"

class VariantsService
    CardVariant = Struct.new(:url, :set, :name, :rarity, :count, :low, :market, :tcgplayerid, keyword_init: true)

    def initialize(search_term)
        @search_term = search_term
        initialize_driver
    end
    
    def scrape_variants
        search_variants
        sleep 2
        variants_array = find_variants
        while next_page_button_visible? && next_page_link do
            sleep 2
            variants_array.concat(find_variants)
        end
        variants_array
    end

    private

    def initialize_driver
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        @driver = Selenium::WebDriver.for :chrome, options: @options
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    end

    def search_variants
        @driver.get "https://www.tcgplayer.com/"
        fill_form
        submit_form
    end

    def fill_form
        search_input = @wait.until do
            @driver.find_element(:css, "input")
        end
        search_input.send_keys @search_term
    end

    def submit_form
        submit_button = @wait.until do
            @driver.find_element(:css, "button.button.search-bar__spyglass")
        end
        submit_button.click
    end

    def find_variants
        variants = @wait.until do 
            @driver.find_elements(:css, "div.search-result__content")   
        end
        variants_array = []
        variants.each do |variant|
            url = safe_find_element(variant, "a")&.attribute("href") 
            set = safe_find_element(variant, "h4")&.text
            name = safe_find_element(variant, "span.product-card__title.truncate")&.text
            rarity = safe_find_element(variant, "section.product-card__rarity")&.text
            count = safe_find_element(variant, "span.inventory__listing-count.inventory__listing-count-block")&.text
            low = safe_find_element(variant, "span.inventory__price")&.text
            market = safe_find_element(variant, "span.product-card__market-price--value")&.text
            tcgplayerid = extract_tcgplayerid(url) 

            variants_array << CardVariant.new(url: url, set: set, name: name, rarity: rarity, count: count, low: low, market: market, tcgplayerid: tcgplayerid)
        end
        variants_array
    end

    def extract_tcgplayerid(url)
        match = url.match(/product\/(\d+)/)
        match ? match[1] : nil
      end      

    def safe_find_element(variant, css_selector) 
        begin
            element = variant.find_element(css: css_selector)
        rescue Selenium::WebDriver::Error::NoSuchElementError
            element = nil
        end
        element
    end

    def next_page_button
        next_button = @driver.find_elements(:css, "a.tcg-button.tcg-button--md.tcg-standard-button.tcg-standard-button--flat").last
    end

    def next_page_link
        pagination_buttons = @driver.find_elements(:css, "a.tcg-button.tcg-button--md.tcg-standard-button.tcg-standard-button--flat")
        next_page_link = pagination_buttons.last.attribute("href")
        if next_page_link && next_page_link != @driver.current_url
          @driver.get next_page_link
          true 
        else
          false 
        end
      end
      

    def next_page_button_visible?
        sleep 2
        @wait.until { next_page_button.displayed? }
    end
end