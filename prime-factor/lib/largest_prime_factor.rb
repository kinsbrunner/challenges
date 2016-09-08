class LargestPrimeFactor
  def largest_prime_of(num)
    return nil if num.nil?
    divs = (2..num/2).select {|i| num % i == 0}
    #puts divs.inspect
    primes = divs.reject {|x| (2..(x/2)).any? {|i| x % i == 0}}
    #puts primes.inspect
    return primes.last || num
  end
  
  def big_prime(num)
    prime = num
    (2..Math.sqrt(num).to_i).each do |i|
      break if prime <= i
      prime /= i while (prime > i && prime % i == 0)
    end
    prime
  end
end

require 'benchmark'
n = 1319537
Benchmark.bm do |x|
  find = LargestPrimeFactor.new
  x.report("Option 1: ") { puts find.largest_prime_of(n) }
  x.report("Option 2: ") { puts find.big_prime(n) }
end