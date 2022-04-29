require "receipt"
require "cart"
require "product"

describe "receipt" do
  it "raise argument error on invalid Cart" do
    prod = Product.new('book', '2', '12.49')
    expect{ Receipt.new(prod) }.to raise_error(ArgumentError)
  end
  
  it "output 1" do
    cart = Cart.new()

    prod = Product.new('book', '2', '12.49')
    cart.add(prod)

    prod = Product.new('music CD', '1', '14.99')
    cart.add(prod)

    prod = Product.new('chocolate bar', '1', '0.85')
    cart.add(prod)

    expect do
      Receipt.new(cart).print
    end.to output("2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Tax: 1.50\nTotal: 42.32\n").to_stdout
  end

  it "output 2" do
    cart = Cart.new()

    prod = Product.new('imported box of chocolates', '1', '10.00')
    cart.add(prod)

    prod = Product.new('imported bottle of perfume', '1', '47.50')
    cart.add(prod)

    expect do
      Receipt.new(cart).print
    end.to output("1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Tax: 7.65\nTotal: 65.15\n").to_stdout
  end

  it "output 3" do
    cart = Cart.new()

    prod = Product.new('imported bottle of perfume', '1', '27.99')
    cart.add(prod)

    prod = Product.new('bottle of perfume', '1', '18.99')
    cart.add(prod)

    prod = Product.new('packet of headache pills', '1', '9.75')
    cart.add(prod)

    prod = Product.new('imported boxes of chocolates', '3', '11.25')
    cart.add(prod)

    expect do
      Receipt.new(cart).print
    end.to output("1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported boxes of chocolates: 35.55\nSales Tax: 7.90\nTotal: 98.38\n").to_stdout
  end
end