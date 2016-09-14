require 'minitest/autorun'

class Array
  def self.product_other_elems(int_array)
    products = []
    
    # for each integer, we find the product of all the integers
    # before it, storing the total product so far each time
    products_so_far = 1
    i = 0
    while i < int_array.length
      products[i] = products_so_far
      products_so_far *= int_array[i]
      i += 1
    end
    
    # for each integer, we find the product of all the integers
    # after it. since each index in products already has the
    # product of all the integers before it, now we're storing
    # the total product of all other integers
    products_so_far = 1
    i = int_array.length - 1
    while i >= 0
      products[i] *= products_so_far
      products_so_far *= int_array[i]
      i -= 1
    end
    
    return products
  end  
end  

class TestProductOtherElems < Minitest::Test
  def test_empty_array
    assert_equal( [] - Array.product_other_elems([]), [] )
  end
  
  def test_1_elem_array
    assert_equal( [1] - Array.product_other_elems([55]), [] )    
  end
  
  def test_product_other_elems
    assert_equal( [84, 12, 28, 21] - Array.product_other_elems([1, 7, 3, 4]), [] )    
  end
end