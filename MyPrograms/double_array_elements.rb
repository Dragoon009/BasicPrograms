#Use the map function to double all the elements in the array.
sample_array = [1,2,3,4,5]
class Mapping 
  def map_method(array)
    array.map!{|num| num * 2}
    print false_array
  end
end  
dummy_array = Mapping.new
dummy_array.map_method(sample_array)

