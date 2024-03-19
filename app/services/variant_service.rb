require "selenium-webdriver"

class VariantService
    def initialize(search_term)
        @search_term = search_term
        initialize_driver
        search_variants
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
        search_results = @wait.until do 
            @driver.find_elements(:css, "div.search-result__content")   
        end
    end
end