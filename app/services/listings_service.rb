require "selenium-webdriver"

class ListingsService
    def initialize(url)
        @url = url
        initialize_driver
    end

    private 

    def initialize_driver
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        @driver = Selenium::WebDriver.for :chrome, options: @options
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    end
end