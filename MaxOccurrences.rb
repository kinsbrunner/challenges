
def max_occ(arr)
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  qty = 0
  num = nil
  freq.each do |key, value|
    if value > qty || (value == qty && num > key) 
      qty = value 
      num = key
    end
  end
  resp = Hash.new
  resp[:number] = num
  resp[:occur] = qty
  return resp
end

def mode3(arr) #alternative way to get most common numbers
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  max = freq.values.max                   # we're only interested in the key(s) with the highest frequency
  freq.select { |k, f| f == max }         # extract the keys that have the max frequency
end

arr = [3, 3, 1, 1, 1, 2, 3, 1, 3]
puts max_occ(arr).inspect
puts mode3(arr).inspect