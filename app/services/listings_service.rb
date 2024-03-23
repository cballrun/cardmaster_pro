require "selenium-webdriver"

class ListingsService
    def initialize(url)
        @url = url
        initialize_driver
        navigate_to_card_page
        while next_page_button_visible? do
            find_listings
            next_page_link
            next_page_button
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
        if next_page_link.class == String
            @driver.get next_page_link
        else
            @driver.quit
        end
    end

    def next_page_button
        next_button = @driver.find_elements(:css, "a.tcg-button.tcg-button--md.tcg-standard-button.tcg-standard-button--flat").last
    end

    def next_page_button_visible?
        sleep 2
        @wait.until { next_page_button.displayed? }
    end
end