require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'relationships' do
    it { should have_many :listings }
    it { should have_many :sales }
  end 

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    #other fields are not always present on a Variant and thus aren't validated
  end
end