class Product
  attr_reader :name, :category, :imported, :price, :quantity, :tax
  
  CATEGORIES = {
    'books': ['book'],
    'medical': ['headache'],
    'food': ['chocolate']
  }

  BASIC_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  ROUNDING_RULE = 0.05
  
  def initialize(name, quantity, price)
    begin
      puts 'No quantity was set.' if quantity.to_i == 0
      puts 'No price was set.' if price.to_f == 0.0
      
      @imported = name.include?('imported')
      @name = name.sub('imported', '').strip
      @quantity = quantity.to_i
      @price = price.to_f.round(2)
      @category = nil
      
      if(@name)
        CATEGORIES.each do |key, value|
          if value.any? { |word| @name.include?(word) }
            @category = key.to_s
          end
        end
      end
    rescue => e
      puts e.message
    end
  end

  def tax
    tax = BASIC_TAX_RATE
    if @category && CATEGORIES[@category.to_sym]
      tax = 0
    end

    if @imported
      tax += IMPORT_TAX_RATE
    end
    
    tax = tax * @price
    rounding = 1 / ROUNDING_RULE
    (rounding * tax).ceil / rounding
  end
end