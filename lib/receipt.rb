class Receipt
  attr_reader :receipt
  def initialize(cart)
    raise ArgumentError, 'Invalid Cart.' if !cart.is_a?(Cart)
    
    @cart = cart
  end

  def print
    @cart.products.each do |product|
      price = ( (product.price + product.tax) * product.quantity).round(2)
      puts "#{product.quantity} #{ product.imported ? 'imported ' + product.name: product.name }: #{sprintf("%.2f", price)}" 
    end

    puts "Sales Tax: #{sprintf("%.2f", @cart.total_tax)}"
    puts "Total: #{sprintf("%.2f", @cart.total_price)}"
  end
end