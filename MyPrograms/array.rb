#!/usr/bin/ruby
array1 = ["some", "thing"]

array2 = ["another", "10"]

array1.each do|row|
  row << array2.shift
end
puts array1

#Join 2 arrays without using inbuilt functions.

