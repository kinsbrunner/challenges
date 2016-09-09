x = 20
y = 50

x = x + y  # x = 70
y = x - y  # y = 70 - 50 # y = 20
x = x - y  # x = 70 - 20 # y = 50


puts "X #{x}"
puts "Y #{y}"


#Alternative way of doing it with XOR binary operation
x = 20
y = 50

a = a ^ b
b = b ^ a
a = a ^ b

puts "X: #{x}"
puts "Y: #{y}"