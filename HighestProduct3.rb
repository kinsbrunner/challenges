require 'minitest/autorun'

# Exercise: Given an array_of_ints, find the highest_product you can get from three of the integers.
# Consider negative numbers as -10 * -10 = 100
# It has to be done in O(n) time and O(1) space.
# Assume that array always has, at least, 3 elements

class Array
  def self.equi(array)
    []
  end  
end  



class TestEqui < Minitest::Test
  def test_zero_elems
    assert_equal( Array.equi([]), -1 )
  end

  def test_positive_1
    assert_equal( Array.equi([-7, 1, 5, 2, -4, 3, 0]), 3 )
  end
  
  def test_positive_2
    assert_equal( Array.equi([9]), 0 )
  end

  def test_positive_3
    assert_equal( Array.equi([1, 2, 3,-4, 8, -2]), 3 )
  end
  
  def test_positive_4
    assert_equal( Array.equi([1, 2, 3,-4, 8, -2, -5]), -1 )
  end  
end