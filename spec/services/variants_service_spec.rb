require "rails_helper"

RSpec.describe SalesService do
    describe "initialization" do
        
        it 'exists' do
            search_term = "Shellder"
            variant_service = VariantService.new(search_term)
            binding.pry
            expect(variant_service).to be_a(VariantService)
        end
    end
end