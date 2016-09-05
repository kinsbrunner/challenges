class Tree
  attr_accessor :payload, :children
  
  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(value)
    return true if self.payload == value
    self.children.each do |child|
      found = child.depth_first_search(value)
      return true if found  
    end
    return false
  end
  
  def breadth_first_search(value)
    return true if self.payload == value
    queue = Queue.new
    queue.enqueue(self)

    while queue.size != 0
      current = queue.dequeue
      current.children.each do |child|  
        return true if child.payload == value
        queue.enqueue(child)
      end
    end

    return false
  end
end


class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
  
  def size
    @queue.count
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts "When searching for 155, I got answer: #{trunk.depth_first_search(155)}"
=begin
puts "When searching for 9, I got answer: #{trunk.breadth_first_search(9)}"
puts "When searching for 13, I got answer: #{trunk.breadth_first_search(13)}"
puts "When searching for 2, I got answer: #{trunk.breadth_first_search(2)}"
puts "When searching for 44, I got answer: #{trunk.breadth_first_search(44)}"
puts "When searching for 4, I got answer: #{trunk.breadth_first_search(4)}"
=end