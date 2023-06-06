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
    "success"
  end

  def get(index)
    begin
      return self.head.value if index === 0
      node = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node
      node.value
    rescue => exception
      p "#{exception.message}"
    end
  end

  def replace(index, new_value)
    # replacing the head
    if index === 0
      new_node = Node.new(new_value, next_node: self.head.next_node)
      self.head.next_node.previous_node = new_node
      self.head = new_node
      return
    end

    begin
      node_to_replace = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node_to_replace
      # replacing the tail
      if !node_to_replace.next_node
        new_node = Node.new(new_value, previous_node: self.tail.previous_node)
        self.tail.previous_node.next_node = new_node
        self.tail = new_node
        return
      end

      # replace an inner node
      new_node = Node.new(new_value, previous_node: node_to_replace.previous_node, next_node: node_to_replace.next_node)
      node_to_replace.previous_node.next_node = new_node
      node_to_replace.next_node.previous_node = new_node
      return
    rescue => exception
      p "#{exception.message}"
    end
  end

  def remove(index)
    begin
      # if the node is the head
      if index === 0
        self.head.next_node.previous_node = nil
        self.head = self.head.next_node
        return
      end

      node = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node
      # if the node is the tail
      if !node.next_node
        node.previous_node.next_node = nil
        self.tail = node.previous_node
        return
      end

      # if the node is in the middle
      node.previous_node.next_node = node.next_node
      node.next_node.previous_node = node.next_node
      return
    rescue => exception
      p "#{exception.message}"
    end
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

  private

  def select_node(index)
    node = self.head
    (1..index).each do
      node = node&.next_node
    end
    node
  end
end
