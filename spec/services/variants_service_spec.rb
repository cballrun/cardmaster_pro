require "rails_helper"

RSpec.describe VariantsService do
    describe "initialization" do
        
        # it 'exists' do
        #     search_term = "Charmander"
        #     variant_service = VariantsService.new(search_term)

        #     expect(variant_service).to be_a(VariantService)
        # end
    end

    describe "scraping" do
        it "scrapes variants" do
            search_term = "Ivysaur"
            variant_service = VariantsService.new(search_term)
            variants = variant_service.scrape_variants

            expect(variants).to be_a(Array)
            expect(variants.first.link).to be_a(String)
        end
    end
end