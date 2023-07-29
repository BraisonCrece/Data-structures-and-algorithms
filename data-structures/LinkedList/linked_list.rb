require_relative "node"

class LinkedList
  attr_accessor :head, :tail

  def append(value)
    raise ArgumentError.new("Error: Invalid value") if value.nil?
    new_node = Node.new(value)
    new_node.previous_node = @tail
    @tail.next_node = new_node if @tail
    @tail = new_node
    @head ||= new_node
    "Success: Value '#{value}' was appended"
  rescue => exception
    warn exception.message
  end

  def prepend(value)
    raise ArgumentError.new("Error: Invalid value") if value.nil?
    new_node = Node.new(value)
    new_node.next_node = @head
    @head.previous_node = new_node if @head
    @head = new_node
    @tail ||= new_node
    "Success: Value '#{value}' was prepended"
  rescue => exception
    warn exception.message
  end

  def insert_at(index, value)
    raise ArgumentError.new("Error: Invalid value") if value.nil?
    raise IndexError.new("Error: Index out of bounds") if index < 0 || index > size
    raise StandardError.new("Error: The list is empty") if size == 0

    case index
    when 0
      prepend(value)
    when size
      append(value)
    else
      new_node = Node.new(value)
      prev_node = select_node(index - 1)
      next_node = select_node(index)

      prev_node.next_node = new_node
      new_node.previous_node = prev_node
      new_node.next_node = next_node
      next_node.previous_node = new_node
    end
    "Success: Value '#{value}' was inserted at index #{index}"
  rescue => exception
    warn exception.message
  end

  def get(index)
    raise StandardError.new("Error: The list is empty") if size === 0
    return @head.value if index === 0
    node = select_node(index)
    raise IndexError.new("Index #{index} out of bounds") if !node
    node.value
  rescue => exception
    warn exception.message
  end

  def replace(index, new_value)
    raise StandardError.new("Error: The list is empty") if size === 0
    node_to_replace = select_node(index)
    raise IndexError.new("Index #{index} out of bounds") unless node_to_replace
    node_to_replace.value = new_value
  rescue => exception
    warn exception.message
  end

  def remove(index)
    raise StandardError.new("Error: The list is empty") if size === 0
    if index === 0
      @head.next_node.previous_node = nil
      @head = @head.next_node
      return
    end

    node = select_node(index)
    raise IndexError.new("Index #{index} out of bounds") if !node
    if !node.next_node
      node.previous_node.next_node = nil
      @tail = node.previous_node
      return
    end

    node.previous_node.next_node = node.next_node
    node.next_node.previous_node = node.next_node
  rescue => exception
    warn exception.message
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
    return 0 if @head.nil?
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
