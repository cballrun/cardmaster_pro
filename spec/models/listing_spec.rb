require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe 'relationships' do
    it { should belong_to(:variant) }
  end 

  describe 'validations' do
    it { should validate_presence_of(:condition) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:seller) }
  end
end