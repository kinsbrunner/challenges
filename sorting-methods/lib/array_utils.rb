module ArrayUtils
	def self.insertion_sort(array)
		array.each_index do |i|
			while array[i] < array[i-1] && i > 0
				aux = array[i-1]
				array[i-1] = array[i]
				array[i] = aux 
				i -= 1
			end
		end
	end
	
	def self.selection_sort(array)
		array.each_index do |i|
			min_idx = i
			min_val = array[i]
			(i..array.count-1).each do |j|
				 if array[j] < min_val
					 	min_idx = j
						min_val = array[j]
				 end
			end
			aux = array[i]
			array[i] = array[min_idx]
			array[min_idx] = aux
		end
	end
	
	def self.merge_sort(array)
		return array if array.length <= 1
	
		mid = array.length / 2 - 1
		left_sorted = self.merge_sort(array[0..mid])
		right_sorted = self.merge_sort(array[mid+1..-1])
		return merge_lists(left_sorted, right_sorted)
	end

	def self.merge_lists(left_sorted, right_sorted)
		merged_list = []
		
		while left_sorted.length > 0 || right_sorted.length > 0
			merged_list << right_sorted.shift if left_sorted.empty? && !right_sorted.empty?
			merged_list << left_sorted.shift if right_sorted.empty? && !left_sorted.empty? 
			if !left_sorted.empty? && !right_sorted.empty?
				if left_sorted[0] <= right_sorted[0]
					merged_list << left_sorted.shift
				else
					merged_list << right_sorted.shift
				end
			end
		end
		merged_list
	end
	
	def self.heap_sort(array)
	end
	
	def self.quicksort(array)
		return array if array.length <= 1

		pivot_index = (array.length / 2).floor
		pivot_value = array[pivot_index]
		array.delete_at(pivot_index)
		
		smaller = []
		greater = []
		
		array.each do |n|
			if n <= pivot_value
				smaller << n
			else
				greater << n
			end
		end
		return self.quicksort(smaller) + [pivot_value] + self.quicksort(greater)
	end
	
	def self.bubble_sort(array)
		n = array.length 
		loops = 0
		loop do
			swapped = false
			#After N loops, the N elements of the right are in place so it is redundant to check them (this could be an improvement)
			(n-1-loops).times do |i| 
				if array[i] > array[i+1]
					aux = array[i]
					array[i] = array[i+1] 
					array[i+1] = aux
					swapped = true
				end
			end
			loops += 1
			break if !swapped
		end
		array
	end
	
	def self.btree_sort(array)
		#This was done on BTreeSort exercise
	end
end
	
#input = [7, 3, 1, 9, 4, 2, 99, 18, 2, 123, 14, 16, 67, 34, 99, 12, 5, 9, 2, 7, 44, 56, 98, 34, 25, 26, 28, 29, 31, 42, 64, 75 ,86 ,88, 98, 111, 1123, 14, 1661, 33, 55, 88, 77, 44, 11]
#puts "Original:   #{input.inspect}"
#puts "Insertion:  #{ArrayUtils.insertion_sort(input).inspect}"
#puts "Selection:  #{ArrayUtils.selection_sort(input).inspect}"
#puts "Merge:      #{ArrayUtils.merge_sort(input).inspect}"
#puts "Quicksort:  #{ArrayUtils.quicksort(input).inspect}"
#puts "Bubblesort: #{ArrayUtils.bubble_sort(input).inspect}"

=begin
require 'benchmark'
input = [7, 3, 1, 9, 4, 2, 99, 18, 2, 123, 14, 16, 67, 34, 99, 12, 5, 9, 2, 7, 44, 56, 98, 34, 25, 26, 28, 29, 31, 42, 64, 75 ,86 ,88, 98, 111, 1123, 14, 1661, 33, 55, 88, 77, 44, 11]
Benchmark.bm do |x|
  x.report("Insertion") { ArrayUtils.insertion_sort(input) }
  x.report("Selection") { ArrayUtils.selection_sort(input) }
  x.report("Merge")     { ArrayUtils.merge_sort(input) }
  x.report("Quicksort") { ArrayUtils.quicksort(input) }
  x.report("Bubblesort"){ ArrayUtils.bubble_sort(input) }
end
=end