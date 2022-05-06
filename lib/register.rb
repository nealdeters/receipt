require './lib/cart'
require './lib/product'
require './lib/receipt'

class Register
  def initialize(file_name)
    @cart = Cart.new()

    File.open(file_name, "r") do |infile|
      while (line = infile.gets)
        raise ArgumentError, "Non standard input. Does not include 'at' within pricing section." if !line.include?(' at ')
        
        quantity_name, price = line.split(' at ')
        quantity, name = quantity_name.split(' ', 2)
        
        product = Product.new(name, quantity, price)
        @cart.add(product)
      end
    end
    
    receipt = Receipt.new(@cart)
    receipt.print
  end
end