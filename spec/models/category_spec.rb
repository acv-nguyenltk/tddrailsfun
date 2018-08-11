require 'rails_helper'

RSpec.describe Category, type: :model do
  fields = ['title']
  before(:each) do
    @Category = Category.create!(title: 'Book')
  end
  describe 'Validation' do
    fields.each do |field|
      it { should validate_presence_of(field)}
    end
  end
  describe 'Association'do
    it {should have_many(:products)}
  end
end
