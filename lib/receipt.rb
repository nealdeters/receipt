class Receipt
  def initialize(cart)
    raise ArgumentError, 'Invalid Cart.' if !cart.is_a?(Cart)
    
    @cart = cart
  end

  def print
    @cart.products.each do |product|
      price = ( (product.price + product.tax) * product.quantity).round(2)
      puts "#{product.quantity} #{ product.imported ? 'imported ' + product.name: product.name }: #{clean_price(price)}" 
    end

    puts "Sales Tax: #{clean_price(@cart.total_tax)}"
    puts "Total: #{clean_price(@cart.total_price)}"
  end

  def clean_price(price)
    sprintf("%.2f", price)
  end
end