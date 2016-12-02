def solution(squares)
  max_values = [0] * squares.length
  max_values[0] = squares[0]
  
  1.upto(squares.length - 1) do |position|
    values = []
    (1..6).each do |dice|
      next if position - dice < 0
      values << squares[position] + max_values[position - dice]
    end
    max_values[position] = values.max
  end
  
  max_values[-1]
end


puts solution([1, -2, 0, 9, -1, -2])  #result: 8
#puts solution([1, -2, 0, 9, -1, 2])   #resut: 12
#puts solution([-2, 5, 1])             #result: 4
#puts solution([0, -4, -5, -2, -7, -9, -3, -10]) #result: -12
    