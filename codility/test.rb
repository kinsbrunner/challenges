def solution(a)
  length = a.length + 1
  sum1 = 0
  sum2 = 0
        
  a.each { |x| sum1 += x }
  
  sum2 = (((length+1)*length)/2) - sum1
  sum2
end

puts solution([2,3,1,4])
puts solution([4,6,2,3,1,8,5,7,10])