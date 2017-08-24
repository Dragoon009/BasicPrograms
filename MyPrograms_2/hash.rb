#!/usr/bin/ruby
#Using hash table, print the frequency of occurence of each character inside an array
Sample_array= %w[ fcb rma fcb ars dor]
class Hash_class
  def hash_method(array)
    count = Hash.new(0)
    array.each do |n|
    count[n]+=1
    end
  puts count
  end
end
dummy_array = Hash_class.new
dummy_array.hash_method(Sample_array)

