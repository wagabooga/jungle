require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "check to see if id is present" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: "5", category: @category)
      @product.save
      expect(@product.id).to be_present
    end
    it "throws an error with no price" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: nil, quantity: "5", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "validate quantity" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "validate category" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: "5", category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "expect product.errors.full_messages to be []" do
      @category = Category.new(name: "myCategoryName")
      @product = Product.new(name: "myProductName", price: "123", quantity: "5", category: @category)
      @product.save
      # byebug
      expect(@product.errors.full_messages).to eq([])
    end
  end
end