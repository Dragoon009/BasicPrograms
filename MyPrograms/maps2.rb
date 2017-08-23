#!/usr/bin/ruby
sample_array = [1,2,3,4,5,"a"]
puts sample_array.map {|a| a.is_a?(Numeric)? a * 2 : a}

