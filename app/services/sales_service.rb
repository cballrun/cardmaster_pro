require "selenium-webdriver"

class SalesService
    def initialize(card_link)
        @card_link = card_link
        initialize_driver
    end

    def scrape_sales
        navigate_to_card_page
        click_view_more_data_button
        while load_more_sales_button_visible? do
            click_load_more_sales_button
        end
        get_all_sales
    end

    private

    def initialize_driver
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        @driver = Selenium::WebDriver.for :chrome, options: @options
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    end

    def navigate_to_card_page
        @driver.get @card_link
    end

    def click_view_more_data_button
        view_more_data_button = @wait.until do
            @driver.find_element(:css, "div.modal__activator")
        end
        view_more_data_button.click
    end

    def load_more_sales_button
        load_more_sales_button = @driver.find_element(:css, "button.sales-history-snapshot__load-more")
    end

    def load_more_sales_button_visible?
        sleep 2
        @wait.until { load_more_sales_button.displayed? }
    rescue Selenium::WebDriver::Error::TimeoutError #THIS IS BAD CODE I NEED TO FIX IT
        false
    end

    def click_load_more_sales_button
        load_more_sales_button = @wait.until do
            @driver.find_element(:css, "button.sales-history-snapshot__load-more")
        end
        sleep 2
        load_more_sales_button.click
    end

    def get_all_sales
        sleep 3
        sales_list = @wait.until do
            @driver.find_element(:css, "ul.is-modal")
        end
        sales_list.find_elements(:css, "li")
    end

end