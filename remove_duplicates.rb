require 'set'
def unique(integers)
	integers.to_set.to_a
end

array = [1, 5, 2, 0, 2, -3, 1, 10]
puts unique(array)