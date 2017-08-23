#!/usr/bin/ruby
Sample_array= %w[ fcb rma fcb ars dor]

count = Hash.new(0)

Sample_array.each do |n|
count[n]+=1
end

puts count
#Using hash table, print the frequency of occurence of each character inside an array.
