#!/usr/bin/ruby
#map to double all elements in array
sample_array = [1,2,3,4,5]
class Mapping{
  def map_method(array){
    sample_array.map!{|num| num * 2}
    print sample_array
    }
  }
}  
dummy_array = Mapping.new
dummy_array.map_array(sample_array)
#[2, 4, 6, 8, 10]


