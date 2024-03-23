require "selenium-webdriver"

class ListingsService
    def initialize(url)
        @url = url
        initialize_driver
        navigate_to_card_page
        find_listings
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
end