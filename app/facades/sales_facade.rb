class SalesFacade
    
    def self.sales_by_card_link(card_link)
        sales_service = SalesService.new(card_link)
        sales_array = sales_service.scrape_sales
        sales_array.each do |sale|
            date = sale.find_element(:css, "span.date")&.text
            condition = sale.find_element(:css, "span.condition")&.text
            quantity = sale.find_element(:css, "span.quantity")&.text
            price = sale.find_element(:css, "span.price")&.text

            # Sale.create((date: date, condition: condition, quantity: quantity, price: price))
        end
    end
end