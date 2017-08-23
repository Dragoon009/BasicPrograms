#!/usr/bin/ruby
sample_array = [1,2,3,4,5]
sample_array.map! { |num| num * 2 }
puts sample_array