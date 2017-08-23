#!/usr/bin/ruby
Class Array{
  def function(array1[], array2[])
  array1 += array2
  print array1
  end
  }  
array1 = ["some", "thing"]
array2 = ["another", "10"]
function(array1[],array2[])

#["some", "thing", "another", "10"]
