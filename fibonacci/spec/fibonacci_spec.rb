require 'spec_helper'

RSpec.describe Fibonacci, type: :model do
  describe 'recursive_fib should work' do 
    it 'Fibonacci(0) = 0' do
      expect(Fibonacci.recursive_fib(0)).to eq(0)
    end

    it 'Fibonacci(1) = 1' do
      expect(Fibonacci.recursive_fib(1)).to eq(1)
    end

    it 'Fibonacci(2) = 1' do
      expect(Fibonacci.recursive_fib(2)).to eq(1)
    end

    it 'Fibonacci(3) = 2' do
      expect(Fibonacci.recursive_fib(3)).to eq(2)
    end

    it 'Fibonacci(4) = 3' do
      expect(Fibonacci.recursive_fib(4)).to eq(3)
    end

    it 'Fibonacci(5) = 5' do
      expect(Fibonacci.recursive_fib(5)).to eq(5)
    end

    it 'Fibonacci(6) = 8' do
      expect(Fibonacci.recursive_fib(6)).to eq(8)
    end

    it 'Fibonacci(7) = 13' do
      expect(Fibonacci.recursive_fib(7)).to eq(13)
    end

    it 'Fibonacci(8) = 21' do
      expect(Fibonacci.recursive_fib(8)).to eq(21)
    end

    it 'Fibonacci(9) = 34' do
      expect(Fibonacci.recursive_fib(9)).to eq(34)
    end    
  end
end