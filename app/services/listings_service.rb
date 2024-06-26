require "selenium-webdriver"

class ListingsService

    CardListing = Struct.new(:condition, :price, :seller, keyword_init: true)

    def initialize(url)
        @url = url
        initialize_driver
    end

    def scrape_listings
        navigate_to_card_page
        listings_array = []
        while next_page_button_visible? && next_page_link do
            listings_array.concat(create_listings)
        end
        @driver.quit 
        listings_array
    end
    

    def create_listings
        listings = find_listings
        listings.map do |listing|
            condition = listing.find_element(:css, "h3").text
            price = listing.find_element(:css, "div.listing-item__price").text
            seller = listing.find_element(:css, "a.seller-info__name").text
            CardListing.new(condition: condition, price: price, seller: seller)
        end
    end

    private 

    def initialize_driver
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        @driver = Selenium::WebDriver.for :chrome, options: @options
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    end

    def navigate_to_card_page
        @driver.get @url
    end

    def find_listings
        sleep 2
        @wait.until do
            @driver.find_elements(:css, "section.listing-item.product-details__listings-results")
        end
    end

    def next_page_link
        pagination_buttons = @driver.find_elements(:css, "a.tcg-button.tcg-button--md.tcg-standard-button.tcg-standard-button--flat")
        next_page_link = pagination_buttons.last.attribute("href")
        if next_page_link && next_page_link != @driver.current_url
            @driver.get next_page_link
        else
            return false 
        end
        true 
    end

    def next_page_button
        next_button = @driver.find_elements(:css, "a.tcg-button.tcg-button--md.tcg-standard-button.tcg-standard-button--flat").last
    end

    def next_page_button_visible?
        sleep 4
        @wait.until { next_page_button.displayed? }
    end
end