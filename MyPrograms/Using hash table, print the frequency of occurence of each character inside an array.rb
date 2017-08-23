#!/usr/bin/ruby
Sample_array = %w[ fcb rma fcb ars dor]
count = Hash.new(0)
Sample_array.each do |n|
count[n] += 1
end
puts count
#{"fcb"=>2, "rma"=>1, "ars"=>1, "dor"=>1}
