require 'minitest/autorun'

class Array
  def self.odd_occurences(a)
    h = {}
    a.each do |num|
      h[num] = 0 if !h.key?(num)
      h[num] += 1
    end

    h.each{ |key, val|
      return key if val % 2 != 0
    }
  end
end

class TestOddOccurences < Minitest::Test
  def test_zero_elems
    assert_equal( Array.odd_occurences([9, 3, 9, 3, 9, 7, 9]), 7 )
  end
end