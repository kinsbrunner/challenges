class ArrayUtils
  def initialize(array)
    @elements = array
  end
  
  def simple_invert
    inverted = @elements.reverse
    inverted.each do |subarray|
      subarray.reverse!
    end
    inverted
  end
  
  def stack_invert
    inverted = invert(@elements)
    inverted.map! {|subarray| invert(subarray)}
  end
  
  private
  
  def invert(array)
    stack = Stack.new
    array.each do |element|
      stack.push(element)
    end
    
    inverted = []
    while !stack.empty?
      inverted << stack.pop
    end
    inverted
  end
end
  
class Stack
  def initialize
    @elements = []
  end
  
  def push(value)
    @elements << value
  end
  
  def pop
    @elements.pop
  end
  
  def empty?
    @elements.empty?
  end
end



au = ArrayUtils.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
#puts au.simple_invert.inspect
puts au.stack_invert.inspect
