module SalesTaxCalc
  class Output(product_name,product_price,tax)
    def initialize
      @total_sale = 0.00
    end 

    def output_method(product_name,product_price,tax)
      product_name.each do |name|
        index = product_name.index(name)
        price = (product_price.at(index)).to_f
        @total_sale = (@total_sale + price).round(2).to_f       #Calculating net sales
        puts "#{name}: #{price}" 
      end
      puts "Total : #{@total_sale}"
      puts "Sales tax : #{tax}"
    end 
  end
end  
