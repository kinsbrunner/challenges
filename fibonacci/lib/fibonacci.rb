module Fibonacci
  def recursive_fib(i, number, prev1, prev2)
    if i < number
      recursive_fib(i+1, number, prev2, prev1 + prev2)
    else
      return prev1 + prev2
    end
  end
end