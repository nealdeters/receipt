class Cart
  attr_reader :products

  def initialize()
    @products = []
  end

  def add(product)
    raise ArgumentError, 'Invalid Product.' if !product.is_a?(Product)

    @products.push(product)
  end

  def quantity_price(price, tax, quantity)
    ( (price + tax) * quantity ).round(2)
  end

  def total_price
    return 0 if @products.empty?
    
    total_price = 0
    @products.each do |product|
      total_price += quantity_price(product.price, product.tax, product.quantity)
    end

    total_price.round(2)
  end

  def total_tax
    return 0 if @products.empty?
    
    total_tax = 0
    @products.each do |product|
      total_tax += (product.tax * product.quantity)
    end
    
    total_tax.round(2)
  end
end