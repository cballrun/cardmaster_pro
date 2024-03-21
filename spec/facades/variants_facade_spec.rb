require 'rails_helper'

RSpec.describe VariantsFacade do

    it 'returns an array of variants' do
        search_term = "Wartortle"
        variants_array = VariantsFacade.variants_by_search_term(search_term)

        expect(variants_array).to be_a(Array)
        expect(variants_array.first).to be_a(Variant)
    end
end