require "cart"
require "product"

describe "cart" do
  it "init" do
    cart = Cart.new()
    expect(cart.products.length).to eq(0)
    expect(cart.total_price).to eq(0)
    expect(cart.total_tax).to eq(0)
  end
  
  it "add" do
    cart = Cart.new()
    prod = Product.new('book', '2', '12.49')
    cart.add(prod)
    expect(cart.products.length).to eq(1)
  end

  it "should throw argument error on adding of invalid product" do
    cart = Cart.new()
    expect{ cart.add("test") }.to raise_error(ArgumentError)
  end

  it "quantity price" do
    cart = Cart.new()
    total_price = cart.quantity_price(14.99, 1.5, 1)
    expect(total_price).to eq(16.49)
  end

  it "total price" do
    cart = Cart.new()

    prod = Product.new('book', '2', '12.49')
    cart.add(prod)

    prod = Product.new('music CD', '1', '14.99')
    cart.add(prod)

    prod = Product.new('chocolate bar', '1', '0.85')
    cart.add(prod)

    expect(cart.total_price).to eq(42.32)

    cart_2 = Cart.new()

    prod = Product.new('imported box of chocolates', '1', '10.00')
    cart_2.add(prod)

    prod = Product.new('imported bottle of perfume', '1', '47.50')
    cart_2.add(prod)

    expect(cart_2.total_price).to eq(65.15)

    cart_3 = Cart.new()

    prod = Product.new('imported bottle of perfume', '1', '27.99')
    cart_3.add(prod)

    prod = Product.new('bottle of perfume', '1', '18.99')
    cart_3.add(prod)

    prod = Product.new('packet of headache pills', '1', '9.75')
    cart_3.add(prod)

    prod = Product.new('imported boxes of chocolates', '3', '11.25')
    cart_3.add(prod)

    expect(cart_3.total_price).to eq(98.38)

    cart_4 = Cart.new()

    prod = Product.new('imported bottle of perfume', '1', '0')
    cart_4.add(prod)

    prod = Product.new('bottle of perfume', '1', '0')
    cart_4.add(prod)

    prod = Product.new('packet of headache pills', '1', '0')
    cart_4.add(prod)

    prod = Product.new('imported boxes of chocolates', '3', '0')
    cart_4.add(prod)

    expect(cart_4.total_price).to eq(0.00)

    cart_5 = Cart.new()

    prod = Product.new('imported bottle of perfume', '0', '27.99')
    cart_5.add(prod)

    prod = Product.new('bottle of perfume', '0', '18.99')
    cart_5.add(prod)

    prod = Product.new('packet of headache pills', '0', '9.75')
    cart_5.add(prod)

    prod = Product.new('imported boxes of chocolates', '0', '11.25')
    cart_5.add(prod)

    expect(cart_5.total_price).to eq(0.00)
  end

  it "total tax" do
    cart = Cart.new()

    prod = Product.new('book', '2', '12.49')
    cart.add(prod)

    prod = Product.new('music CD', '1', '14.99')
    cart.add(prod)

    prod = Product.new('chocolate bar', '1', '0.85')
    cart.add(prod)

    expect(cart.total_tax).to eq(1.50)

    cart_2 = Cart.new()

    prod = Product.new('imported box of chocolates', '1', '10.00')
    cart_2.add(prod)

    prod = Product.new('imported bottle of perfume', '1', '47.50')
    cart_2.add(prod)

    expect(cart_2.total_tax).to eq(7.65)

    cart_3 = Cart.new()

    prod = Product.new('imported bottle of perfume', '1', '27.99')
    cart_3.add(prod)

    prod = Product.new('bottle of perfume', '1', '18.99')
    cart_3.add(prod)

    prod = Product.new('packet of headache pills', '1', '9.75')
    cart_3.add(prod)

    prod = Product.new('imported boxes of chocolates', '3', '11.25')
    cart_3.add(prod)

    expect(cart_3.total_tax).to eq(7.90)
  end
end