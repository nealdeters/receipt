require "product"

describe "product" do
  it "warn if invalid quantity set" do
    expect do
      Product.new('book', 'badvalue', '12.49')
    end.to output("No quantity was set.\n").to_stdout

    expect do
      Product.new('book', '0', '12.49')
    end.to output("No quantity was set.\n").to_stdout
  end

  it "warn if invalid price set" do
    expect do
      Product.new('book', '2', 'invalid')
    end.to output("No price was set.\n").to_stdout

    expect do
      Product.new('book', '2', '0.0')
    end.to output("No price was set.\n").to_stdout

    expect do
      Product.new('book', '2', '0')
    end.to output("No price was set.\n").to_stdout
  end

  it "quantity" do
    prod = Product.new('imported pills', '2', '1000.49')
    expect(prod.quantity).to eq(2)

    prod_2 = Product.new('imported pills', '24', '1000.49')
    expect(prod_2.quantity).to eq(24)

    prod_3 = Product.new('imported pills', '400', '1000.49')
    expect(prod_3.quantity).to eq(400)
  end
  
  it "price" do
    prod = Product.new('book', '2', '12.49')
    expect(prod.price).to eq(12.49)

    prod_2 = Product.new('book', '22', '120.49')
    expect(prod_2.price).to eq(120.49)

    prod_3 = Product.new('book', '200', '1200.49')
    expect(prod_3.price).to eq(1200.49)
  end

  it "name/imported" do
    prod = Product.new('imported chocolates', '2', '12.49')
    expect(prod.imported).to eq(true)
    expect(prod.name).to eq('chocolates')

    prod_2 = Product.new('amazing chocolates', '2', '12.49')
    expect(prod_2.imported).to eq(false)
    expect(prod_2.name).to eq('amazing chocolates')
  end

  it "categories" do
    prod = Product.new('book', '2', '12.49')
    expect(prod.category).to eq('books')

    prod_2 = Product.new('imported headache pills', '2', '12.49')
    expect(prod_2.category).to eq('medical')

    prod_3 = Product.new('amazing chocolates', '2', '12.49')
    expect(prod_3.category).to eq('food')

    prod_4 = Product.new('movie tickets', '2', '12.49')
    expect(prod_4.category).to eq(nil)
  end

  it "tax" do
    prod = Product.new('book', '2', '12.49')
    expect(prod.tax).to eq(0)

    prod_2 = Product.new('imported book', '1', '1.50')
    expect(prod_2.tax).to eq(0.1)
  end
end