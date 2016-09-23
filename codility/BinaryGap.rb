require 'minitest/autorun'

class Integer
  def self.binary_gap(num)
    max_seq = 0
    curr_seq = 0
    count = false
    
    binary_num = num.to_s(2).chars
    binary_length = binary_num.length
      
    for i in 0..(binary_length-1)
      if binary_num[i] == '1' && count == true
        if curr_seq > max_seq
          max_seq = curr_seq
        end
        curr_seq = 0
        count = false
      end
      
      if binary_num[i] == '1' && count == false && i < (binary_length-2)
        #Start counting
        count = true
      end
      
      curr_seq += 1 if binary_num[i] == '0' && count == true
    end
    
    max_seq
  end
end


class TestBinaryGap < Minitest::Test
  def test_1
    assert_equal( Integer.binary_gap(9), 2 )
  end
  
  def test_2
    assert_equal( Integer.binary_gap(72), 2 )
  end
  
  def test_3
    assert_equal( Integer.binary_gap(8023), 1 )
  end
  
  def test_4
    assert_equal( Integer.binary_gap(15), 0 )
  end
  
  def test_5
    assert_equal( Integer.binary_gap(0), 0 )
  end  

  def test_6
    assert_equal( Integer.binary_gap(289), 4 )
  end
  
  def test_7
    assert_equal( Integer.binary_gap(137), 3 )
  end
  
  def test_8
    assert_equal( Integer.binary_gap(8), 0 )
  end
  
  def test_9
    assert_equal( Integer.binary_gap(51), 2 )
  end
end