module SalesTaxCalc  
  class Input

    def initialize
      @str = "NOT FIN"
      @input = Array.new 
      @product_name = Array.new 
      @dummy_product_name = Array.new  
      @product_quantity = []
      @values = Array.new
      @product_price = Array.new
    end 

    def userinput
      puts 'Enter stuff'
      until @str == "FIN" 
        names = gets
        names_1 = gets
        if names_1 == "\n"
          @input << names 
          @str = "FIN"
        else
          @input << names 
          @input << names_1     #Storing product names in an array
        end
      end
      if @input.count !=1
        @input.pop
      end
      @input.each do |name|
        @values << name.split(" ")  #Spliting each input on basis of " "
      end 
      @values.each do |n|
        @product_quantity << n.shift  # Storing product quantity in an array
      end
      @values.each do |n|
        @product_price << (n.pop).to_f   #Converting product prices to floating point
      end
      @values.each do |m|
        m.pop
        (@dummy_product_name << m).to_s 
      end
      @dummy_product_name.each do|m|
        m.each do|o|
          o = o.upcase!
        end
      end
      return @product_price 
    end

    def inputname  
      dummy_string = ""
      @dummy_product_name.each do |m|
        dummy_string = m.join(" ")
        @product_name << "#{dummy_string}"  #Storing product names in an array
      end
      return @product_name 
    end
 
  end
end





