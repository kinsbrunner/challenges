module Fibonacci
  def Fibonacci.recursive_fib(n)
    return n if n < 2
    return recursive_fib(n - 1) + recursive_fib(n - 2)
  end

  def Fibonacci.iterative_fib(n)
    a = 0
    b = 1
    n.times do
      temp = a
      a = b
      b = b + temp 
    end
    return a
  end
end


require 'benchmark'
n = 38
Benchmark.bm do |x|
  x.report("recursive_fib") { puts Fibonacci.recursive_fib(n) }
  x.report("iterative_fib") { puts Fibonacci.iterative_fib(n) }
end