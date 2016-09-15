require 'minitest/autorun'

#Exercise:
# A non-empty zero-indexed array A consisting of N integers is given. 
# The leader of this array is the value that occurs in more than half of the elements of A.
# You are given an implementation of a function: def solution(A) that, given a non-empty 
# zero-indexed array A consisting of N integers, returns the leader of array A. 
# The function should return −1 if array A does not contain a leader.
#
# For example, given array A consisting of ten elements such that: A = [4, 2, 2, 3, 2, 4, 2, 2, 6, 4]
# the function should return −1, because the value that occurs most frequently in the array, 2, 
# occurs five times, and 5 is not more than half of 10.
# Given array A consisting of five elements such that: A = [1,1,1, 50, 1] the function should return 1.
#
# Assume that:
# - N is an integer within the range [1..1,000,000];
# - each element of array A is an integer within the range [0..2147483647].
#
#Complexity:
# - expected worst-case time complexity is O(N*log(N));
# - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
# - elements of input arrays can be modified.

class Array
  def self.solution(array)
    totals = array.inject(Hash.new(0)) {|h, v| h[v] += 1; h }
    num, qty = totals.max_by{|k,v| v}
    qty * 2 > array.length ? num : -1
  end  
end  


class TestSolution < Minitest::Test
  def test_negative_1
    assert_equal( Array.solution([4, 2, 2, 3, 2, 4, 2, 2, 6, 4]), -1 )
  end

  def test_negative_2
    assert_equal( Array.solution([1, 1, 1, 50, 1, 2, 2, 2, 2, 2]), -1 )
  end  
  
  def test_positive_1
    assert_equal( Array.solution([1, 1, 1, 50, 1]), 1 )
  end
  
  def test_positive_2
    assert_equal( Array.solution([1, 1, 1, 50, 1, 7, 7, 7, 7, 7, 7]), 7 )
  end
end