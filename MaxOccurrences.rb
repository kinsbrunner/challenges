
def max_occ(arr)
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  qty = 0
  num = nil
  freq.each do |key, value|
    qty = value if value > qty || (value == qty && num > key)
    num = key   if value > qty || (value == qty && num > key)
  end
  resp = Hash.new
  resp[:number] = num
  resp[:occur] = qty
  return resp
end

arr = [3, 3, 1, 1, 1, 2, 3, 1, 3]
puts max_occ(arr).inspect