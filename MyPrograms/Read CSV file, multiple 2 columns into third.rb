#!/usr/bin/ruby

require 'csv'
multiplying_array = Array.new
CSV.foreach("/home/rails/test2.csv" , converters: :numeric) do |row|
    multiplying_array<< row[1]*row[0]
 end
Dummy_array = CSV.read("/home/rails/test2.csv")
Dummy_array.each do|row|
  row << multiplying_array.shift
end
CSV.open("/home/rails/test2.csv" , 'w') do |column3|
  Dummy_array.each { |r|
  column3 << r }
end
CSV.foreach("/home/rails/test2.csv") do |row|
    print row
end
#["1", "2", "2"]["3", "4", "12"]["5", "6", "30"]["7", "8", "56"]


