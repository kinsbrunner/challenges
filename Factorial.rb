def factorial_rec(num)
  return 1 if num <= 1
  num * factorial_rec(num - 1)
end

def factorial_loop(num)
  total = 1
  while num > 1
    total = num * total
    num = num - 1
  end
  total
end

puts factorial_rec(5)
puts factorial_loop(5)