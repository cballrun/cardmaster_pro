require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'relationships' do
    it { should belong_to(:variant) }
  end 

  describe 'validations' do
        it { should validate_presence_of(:date) }
        it { should validate_presence_of(:condition) }
        it { should validate_presence_of(:quantity) }
        it { should validate_presence_of(:price) }
  end
end