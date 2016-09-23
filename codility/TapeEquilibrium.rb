require 'minitest/autorun'

class Array
  def self.tape_equilibrium(array)
    return 0 if array.empty? || array.nil?

    sum_total = array.inject(0, :+)
    sum_left = 0
    sum_right = 0
    diffs = []
    i = 0

    while i < (array.length-1)
      sum_left += array[i]
      sum_right = sum_total - sum_left
      diffs << (sum_left - sum_right).abs
      i += 1
    end

    return diffs.min
  end
end


class TestTapeEquilibrium < Minitest::Test
  def test_1
    assert_equal( Array.tape_equilibrium([3, 1, 2, 4, 3]), 1 )
  end
end