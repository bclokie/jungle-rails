require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "has all valid attributes required" do
      @product = Product.new({
        name: "Jon",
        description: "good stuff",
        quantity: 22,
        category: @category,
        price: 100.00 
      })
      expect(@product).to_not be_valid
    end

    it "is not valid if no name" do
      @product = Product.new({
        name: nil,
        description: "good stuff",
        quantity: 22,
        category: @category,
        price: 100.00 
      })
      expect(@product).to_not be_valid
    end

    it "is not valid if no price" do
      @product = Product.new({
        name: "Jon",
        description: "good stuff",
        quantity: 22,
        category: @category,
        price: nil 
      })
      expect(@product).to_not be_valid
    end

    it "is not valid if no quantity" do
      @product = Product.new({
        name: "Jon",
        description: "good stuff",
        quantity: nil,
        category: @category,
        price: 100.00 
      })
      expect(@product).to_not be_valid
    end

    it "is not valid if no category" do
      @product = Product.new({
        name: "Jon",
        description: "good stuff",
        quantity: 22,
        category: nil,
        price: 100.00 
      })
      expect(@product).to_not be_valid
    end

  end
end