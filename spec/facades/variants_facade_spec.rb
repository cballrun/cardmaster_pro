require 'rails_helper'

RSpec.describe VariantsFacade do

    it 'exists' do
        search_term = "Charmander"
        variants_array = VariantsFacade.variants_by_search_term(search_term)
        binding.pry
        expect(variants_array).to be_a(Array)
    end
end