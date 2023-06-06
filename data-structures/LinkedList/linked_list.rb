require_relative "node"

class LinkedList
  attr_accessor :head, :tail

  def add(value)
    node = Node.new(value)
    node.value = value
    if !head
      self.head = node
      self.tail = node
    else
      node.previous_node = self.tail
      self.tail.next_node = node
      self.tail = node
    end
  end

  def get(index)
    return self.head.value if index === 0
    node = nil
    (1..index).each do
      node = self.head.next_node
    end
    node.value
  end

  def print_list
    node = self.head
    list = []
    while node
      list << node.value
      node = node.next_node
    end
    list
  end
end
