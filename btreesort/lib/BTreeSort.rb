class BTreeSort
  attr_accessor :payload, :left, :right
  
  def initialize(payload = nil, left = nil, right = nil)
    @payload = payload
    @left = left
    @right = right
  end
  
  def build_tree(array)
    return array if array.nil? || array.empty?
    self.payload = array.shift
    array.each do |node|
      add_node(node, self)
    end
  end
  
  def flatten_tree(sorted_array)
    left.flatten_tree(sorted_array) unless left.nil?
    sorted_array << payload
    right.flatten_tree(sorted_array) unless right.nil?
  end
  
  def sort(array)
    self.build_tree(array)
    sorted_array = Array.new
    self.flatten_tree(sorted_array)
    sorted_array
  end
  
  private
  
  def add_node(value, current_node)
    if value < current_node.payload && current_node.left == nil
      current_node.left = BTreeSort.new(value, nil, nil)
    elsif value < current_node.payload && current_node.left != nil
      add_node(value, current_node.left)
    elsif value > current_node.payload && current_node.right == nil
      current_node.right = BTreeSort.new(value, nil, nil)
    elsif value > current_node.payload && current_node.right != nil
      add_node(value, current_node.right)
    end
  end
end


tree = BTreeSort.new
sorted_array = tree.sort([7, 4, 9, 1, 6, 14, 10])
puts sorted_array.inspect