#Use the map function to double all the elements in the array. However, handle edge cases (like array can have a character) as well
sample_array = [1,2,3,4,5,"a"]
class Mapping
  def map_method(array)
    print array.map {|a| a.is_a?(Numeric)? a * 2 : a}
  end
end
dummy_array = Mapping.new
dummy_array.map_method(sample_array)
#[2, 4, 6, 8, 10, "a"]
