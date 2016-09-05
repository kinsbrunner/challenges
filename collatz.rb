def get_collatz(n)
  sequence = []
  while n != 1
    sequence << n
    if n % 2 == 0
      n = n/2
    else
      n = 3*n + 1
    end
  end
  sequence << n #This adds 1
  return sequence
end

def get_longest_seq(num)
  seq = Array.new
  num.times do |i|
    seq[i] = get_collatz(i+1).length
  end
  seq.index(seq.max) + 1
end

n = 1000000
puts "The biggest Collatz sequence until number #{n} is #{get_longest_seq(1000000)}"