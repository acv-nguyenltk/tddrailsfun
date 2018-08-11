require 'rails-helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = Product.create!(title: 'aaa', description: 'description', price: 12)
  end




end
