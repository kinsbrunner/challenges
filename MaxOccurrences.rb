# Given an array, code should return a Hash with the most repeated number and the amount of times. 
#  If there are more than 1 most repeated number, return the lowest.

def max_occ(arr)
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  qty = 0
  num = nil
  freq.each do |key, value|
    if value > qty || (value == qty && key < num) 
      qty = value 
      num = key
    end
  end
  
  { :number => num, :occur => qty }
end

def max_occ_2(arr) #alternative way to get most common numbers
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  max = freq.values.max                  # we're only interested in the key(s) with the highest frequency
  freq.select! { |k, f| f == max}        # extract the keys that have the max frequency
  
  resp = { number: freq.keys.min, occur: max }
end

arr = [1, 3, 3, 3, 1, 1, 1, 2, 3, 1, 3]
puts max_occ(arr).inspect
puts max_occ_2(arr).inspect