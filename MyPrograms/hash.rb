#!/usr/bin/ruby
Sample_array= %w[ fcb rma fcb ars dor]

count = Hash.new(0)

Sample_array.each do |n|
count[n]+=1
end

puts count