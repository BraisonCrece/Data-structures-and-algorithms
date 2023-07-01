require_relative "Node"

class Stack
  attr_reader :length

  def initialize()
    @head = nil
    @length = 0
  end

  def push(item)
    @length += 1
    new_node = Node.new(item)
    if @head
      new_node.previous = @head
      @head = new_node
      return self
    end
    @head = new_node
    return self
  end

  def pop
    return nil if @length == 0
    head_node = @head
    @length = [0, @length - 1].max
    @head = head_node.previous
    return head_node.value
  end

  def peek
    return @head&.value
  end

  def inspect
    values = []
    current_node = @head
    while current_node
      values << current_node.value
      current_node = current_node.previous
    end
    "Stack: {values: #{values.reverse.join(", ")}, length: #{@length}}"
  end
end
