#Read from a CSV file, multiple two columns, and then write back to the CSV file.

require 'csv'
multiplying_array = Array.new
CSV.foreach("/home/rails/test2.csv" , converters: :numeric) do |row| #Convert string input to numeric
    multiplying_array<< row[1]*row[0]  #Multiply two rows & store value in an array
end
Dummy_array = CSV.read("/home/rails/test2.csv") #Store table data in a dummy array
Dummy_array.each do|row|
  row << multiplying_array.shift #Add the product of rows to the dummy array
end
CSV.open("/home/rails/test2.csv" , 'w') do |column3|
  Dummy_array.each { |r|
  column3 << r                #Add product column to original csv file
  }
end
CSV.foreach("/home/rails/test2.csv") do |row|
    print row                #Print final csv file
end

#["1", "2", "2"]["3", "4", "12"]["5", "6", "30"]["7", "8", "56"]


