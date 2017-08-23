#!/usr/bin/ruby
sample_array = [1,2,3,4,5,"a"]
print sample_array.map {|a| a.is_a?(Numeric)? a * 2 : a}
#[2, 4, 6, 8, 10, "a"]
