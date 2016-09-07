require 'minitest/autorun'

class StringReverse
  def initialize(string = nil)
    @string = string
  end
  
  def reverse
    return nil if @string.nil?
    string_a = @string.chars
    reversed_a = []
    while !string_a.empty?
      reversed_a.push(string_a.pop)
    end
    reversed_a.join
  end
end


class StringReverseTest < MiniTest::Test
  def test_reverse_nil_case
    string = StringReverse.new
    assert_nil string.reverse
  end

  def test_reverse_short_string
    string = StringReverse.new "hello world!"
    assert_equal "!dlrow olleh", string.reverse
  end

  def test_reverse_long_string
    string = StringReverse.new "This is a nice and long string." 
    assert_equal ".gnirts gnol dna ecin a si sihT", string.reverse
  end
end