require_relative "node"

class LinkedList
  attr_accessor :head, :tail

  def add(value)
    node = Node.new(value)
    node.value = value
    if !head
      @head = node
      @tail = node
    else
      node.previous_node = @tail
      @tail.next_node = node
      @tail = node
    end
    "success"
  end

  def get(index)
    begin
      return @head.value if index === 0
      node = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node
      node.value
    rescue => exception
      p "#{exception.message}"
    end
  end

  def replace(index, new_value)
    begin
      node_to_replace = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node_to_replace
      # Replace the value directly
      node_to_replace.value = new_value
      new_value # This should be the replaced node's value
    rescue => exception
      p "#{exception.message}"
    end
  end

  def remove(index)
    begin
      # if the node is the head
      if index === 0
        @head.next_node.previous_node = nil
        @head = @head.next_node
        return
      end

      node = select_node(index)
      raise "INDEX #{index} OUT OF BOUNDS" if !node
      # if the node is the tail
      if !node.next_node
        node.previous_node.next_node = nil
        @tail = node.previous_node
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

  def inspect
    node = @head
    list = []
    while node
      list << node.value
      node = node.next_node
    end
    list
  end

  def size
    return 0 if @head === nil
    size = 1
    node = @head
    while node.next_node
      size += 1
      node = node.next_node
    end
    size
  end

  private

  def select_node(index)
    node = @head
    (1..index).each do
      node = node&.next_node
    end
    node
  end
end
