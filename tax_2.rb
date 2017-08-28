class Tax_calc
  def initialize
    @str = "NOT FIN"
    @sales_tax = 0.00
    @total_sale = 0.00
    @product_name = Array.new   
    @product_price = Array.new
    @food_array = [ "CHOCOLATE BAR", "CHOCOLATE BOX"]
    @medicine_array = ["HEADACHE PILL"]
  end

  def input
    until @str == "FIN"             #FIN marks end of bill
      puts "Enter product(FIN for bill): "
      @str = gets.chomp
      if @str == @str.upcase       #Checking if name entered is in upper case
        @product_name << str      #Storing product names in an array
      else
      @str = @str.upcase!
      @product_name << @str      #Storing product names in an array
      end
      if @str != "FIN"
        puts "Enter price: "
        prc = gets
        float_prc = prc.to_f
        @product_price << float_prc  #Storing product prices as floating point in an array
      end
    end
    @product_name.pop
    algo_method
  end
 
  def algo_method   
    @product_name.each do |name|
      #IMPORTED CODE   
      if name.include? "IMPORTED"
        dummy_name = name
        dummy_name.slice! "IMPORTED "
        if @food_array.include?(dummy_name)  #Check if product is a food item
          index = @product_name.index(name)
          price = @product_price.at(index)   #Fetching the price of specific product
          cost = (price * 1.05).round(2).to_f 
          @sales_tax = (price * 0.05).round(2).to_f 
          @product_price.map!{|x| x == price ? cost : x} #Updating product_price to replace price with cost
        else
          if @medicine_array.include?(dummy_name)   #Check if a product is a medicine
            index = @product_name.index(name)
            price = @product_price.at(index)   #Fetching the price of specific product
            cost = (price * 1.05).round(2).to_f 
            @sales_tax = (price * 0.05).round(2).to_f 
            @product_price.map!{|x| x == price ? cost : x} #Updating product_price to replace price with cost
          else
            case dummy_name
            when "BOOK"              #Check if product is book
              index = @product_name.index(name)
              price = @product_price.at(index)   #Fetching the price of specific product
              cost = (price * 1.05).to_f 
              sales_tax = (price * 0.05).round(2).to_f 
              @product_price.map!{|x| x == price ? cost : x} #Updating product_price to replace price with cost   
            else
              index = @product_name.index(name)
              price4 = @product_price.at(index)   #Fetching the price of specific product
              cost4 = (price4 * 1.15).round(2).to_f 
              sales_tax = (price4 * 0.15).round(2).to_f
              @product_price.map!{|x| x == price4 ? cost4 : x} #Updating product_price to replace price with cost
            end
          end
        end

      else
      #DOMESTIC CODE
        if @food_array.include?(name)  #Check if product is a food item
          @sales_tax = @sales_tax 
          else
            if @medicine_array.include?(name)   #Check if a product is a medicine
             @sales_tax = @sales_tax  
            else
              case name
              when "BOOK"              #Check if product is book
                @sales_tax = @sales_tax   
              else
                index = @product_name.index(name)
                price = @product_price.at(index)   #Fetching the price of specific product
                cost = (price * 1.10).round(2).to_f 
                @sales_tax = (price * 0.1).round(2).to_f
                @product_price.map!{|x| x == price ? cost : x} #Updating product_price to replace price with cost
              end
            end
          end   
      end
    end
  round_off
  end

   #Round off sales tax
  def round_off 
   dummy_number = @sales_tax * 100      
   dummy_number = dummy_number % 100
   dummy_number = dummy_number / 10
   dummy_number2 = (dummy_number*2).ceil.to_f / 2
   dummy_number2 = dummy_number2 *10
   dummy_number3 = dummy_number * 10
   @sales_tax = (@sales_tax * 100) - dummy_number3 + dummy_number2
   @sales_tax = @sales_tax / 100
   output
 end

 def output
   @product_name.each do |name|
     index = @product_name.index(name)
     price = (@product_price.at(index)).to_f
     @total_sale += price        #Calculating net sales
     puts "#{name}: #{price}" 
   end
   puts "Total : #{@total_sale}"
   puts "Sales tax : #{@sales_tax}" 

 end 



end  

dummy_object = Tax_calc.new
dummy_object.input


 






