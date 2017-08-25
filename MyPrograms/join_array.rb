#Join 2 arrays WITHOUT using inbuilt functions.
array_1 = ["some", "thing"]
array_2 = ["another", "10"]
class Array_join
  def join_method(array1,array2)
    array1 += array2
    print array1
  end
end
dummy_array = Array_join.new
dummy_array.join_method(array_1,array_2)

#Join 2 arrays without using inbuilt functions.

