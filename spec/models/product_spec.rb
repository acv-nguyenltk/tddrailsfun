require 'rails_helper'

RSpec.describe Product, type: :model do
  fields = ['title', 'description', 'price']
  before(:each) do
    @product = Product.create!(title: 'aaa', description: 'description', price: 12)
  end

  describe 'Validations'do
    fields.each do |field|
      it { should validate_presence_of(field) }
    end
  end

  # describe 'Numerically' do
  #   it { should validate_numericality_of(:price) }
  #   it { should validate_numericality_of(:price).greater_than_to(0) }
  # end


end
