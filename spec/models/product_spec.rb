require 'rails_helper'

RSpec.describe Product, type: :model do
  fields = ['title', 'description', 'price']
  before(:each) do
    @product = Product.create!(title: 'AAA', description: '<h1>description</h1>', price: 1)
  end

  describe 'Validations' do
    fields.each do |field|
      it { should validate_presence_of(field) }
    end
    it 'lowercase' do
      expect(@product.title).to eq 'aaa'
    end
    it 'strip_html_description' do
      expect(@product.description).to eq 'description'
    end
    it 'compare_title_length_with_desciption_length' do
      @product.title = 'title is shorter than description'
      expect(@product.save).to eq false
      expect(@product.errors.full_messages).to include 'Title must be shorter than description'
    end

  end

  describe 'Association' do
    it { should belong_to(:category) }
  end

  describe 'Numerically' do
    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end


end
