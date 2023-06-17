require_relative 'Node'
class Queue
  attr_reader :length, :head, :tail

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  def enqueue(value)
    node = Node.new(value)
    if !@head
      @head = node
      @tail = node
      @length = 1
      return
    end
    @tail.next_node = node
    @tail = node
    @length += 1
  end

  def dequeue
    return "THE QUEUE IS EMPTY" if !@head
    @length -= 1
    if @head == @tail
      value = @head.value
      @head = nil
      @tail = nil
      return value
    end
    value = @head.value
    @head = @head.next_node
    value
  end

  def peek
    return "THE QUEUE IS EMPTY" if !@head
    @head.value
  end
end
