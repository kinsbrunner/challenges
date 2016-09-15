require 'minitest/autorun'

#Exercise:
# The equilibrium index of a sequence is an index such that the sum of elements at lower 
# indexes is equal to the sum of elements at higher indexes. For example, in a sequence A:
# A = [-7, 1, 5, 2, -4, 3, 0]
# 3 is an equilibrium index, because:
# A[0]+A[1]+A[2]=A[4]+A[5]+A[6]
# 6 is also an equilibrium index, because:
# A[0]+A[1]+A[2]+A[3]+A[4]+A[5]=0
# (The sum of zero elements is zero) 7 is not an equilibrium index - because it is not a 
# valid index of sequence A. If you still have doubts, here is a precise definition: The 
# integer k is an equilibrium index of a sequence A[0],A[1]..,A[n-1] if and only if 0<= k 
# and sum(A[0..(k-1)])=sum(A[(k+1)..(n-1)]). Assume the sum of zero elements is equal to zero. 
#
# Write a function: int equi(int A[])
# that, given a sequence, returns its equilibrium index (any) or -1 if no equilibrium index 
# exists. Assume that the sequence may be very long.

class Array
  def self.equi(array)
    return -1 if array.empty? || array.nil?
    
    sum = array.inject(0, :+)
    sum_left = 0
    sum_right = 0
    
    array.each_with_index{ |v, i|
      sum_right = sum - sum_left - array[i]
      return i if sum_left == sum_right
      sum_left += array[i]
    }
    
    return -1
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