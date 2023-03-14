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


# ATTEMPT ONE: way too complicated and took forever...
# require 'rails_helper'

# # validates :name, presence: true
# # validates :price, presence: true
# # validates :quantity, presence: true
# # validates :category, presence: true

# RSpec.describe Product, type: :model do
#   describe 'Validations' do

#     it "has all valid attributes required" do
#       @category = Category.new
#       @category.id = 6
#       @category.name = 'test'

#       @product = Product.new
#       @product.name = "prod"
#       @product.price = 10000
#       @product.quantity = 10000
#       @product.category = @category

#       @category.products = [@product]

#       @product.save

#       expect(@product).to be_valid
#     end

#     it "is not valid if no name" do
#       @category = Category.new
#       @category.id = 6
#       @category.name = 'test'

#       @product = Product.new
#       @product.name = nil
#       @product.price = 10000
#       @product.quantity = 10000
#       @product.category_id = @category
#       @category.products = [@product]

#       @product.save

#       expect(@product.errors.full_messages.length).to eql(1)
#       expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
#       expect(@product).to_not be_valid
#     end

#     it "is not valid if no price" do
#       @category = Category.new
#       @category.id = 6
#       @category.name = 'test'

#       @product = Product.new
#       @product.name = 'test'
#       @product.price = nil
#       @product.quantity = 10000
#       @product.category_id = @category
#       @category.products = [@product]

#       @product.save

#       expect(@product.errors.full_messages.length).to eql(1)
#       expect(@product.errors.full_messages[0]).to eql("Price is not a number")
#       expect(@product).to_not be_valid
#     end

#     it "is not valid if no quantity" do
#       @category = Category.new
#       @category.id = 6
#       @category.name = 'test'

#       @product = Product.new
#       @product.name = 'test'
#       @product.price = 1
#       @product.quantity = nil
#       @product.category_id = @category
#       @category.products = [@product]
#       @product.save

#       expect(@product.errors.full_messages.length).to eql(1)
#       expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
#       expect(@product).to_not be_valid
#     end

#     it "is not valid if no category" do
#       @category = Category.new
#       @category.id = 6
#       @category.name = 'test'

#       @product = Product.new
#       @product.name = 'test'
#       @product.price = 1
#       @product.quantity = 1
#       @product.category_id = nil
#       @product.save
#       @category = [@product]

#       expect(@product.errors.full_messages.length).to eql(2)
#       expect(@product.errors.full_messages[0]).to eql("Category must exist")
#       expect(@product).to_not be_valid

#     end

#   end
# end