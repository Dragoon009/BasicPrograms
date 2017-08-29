module SalesTaxCalc
  class TaxCalc

    def initialize
      @food_array = [ "CHOCOLATE BAR", "CHOCOLATE BOX"]
      @medicine_array = ["HEADACHE PILL"]
      @book_array = ["BOOK"]
      @tax = 0
    end

    def imported?(name)
      name.include? 'IMPORTED'
    end

    def exempt?(name)
      book?(name) || medicine?(name) || food?(name)
    end

    def food?(name)
      @food_array.include?(name)
    end 

    def book?(name)
      @book_array.include?(name)
    end 

    def medicine?(name)
      @medicine_array.include?(name)
    end

    def round_off
      dummy_number = @tax * 100      
      dummy_number = dummy_number % 100
      dummy_number = dummy_number / 10
      dummy_number2 = (dummy_number*2).ceil.to_f / 2
      dummy_number2 = dummy_number2 *10
      dummy_number3 = dummy_number * 10
      @tax = (@tax * 100) - dummy_number3 + dummy_number2
      @tax = @tax / 100
      return @tax
    end     

    def algo_method (product_name,product_price)  
      product_name.each do |name|
      index = product_name.index(name)
      price = product_price.at(index)
      amount = 0
      price = price * 1.1 if !exempt?(name)
      tax = price * 0.1 if !exempt?(name)
      price = price * 1.05 if imported?(name)
      @tax = price * 0.05 if imported?(name)
      end
      return product_price 
    end 
  end
end
