# frozen_string literal: true

class BinaryTreeTools # rubocop:disable Style/Documentation
  def self.depth_first_search(node:, value:)
    return false unless node
    return true if node.value == value

    return depth_first_search(node: node.right, value: value) if node.value < value
    return depth_first_search(node: node.left, value: value) if node.value >= value
  end

  def self.breath_first_search(head:, needle:)
    bfs(head: head, needle: needle)
  end

  def self.pre_order_search(head:)
    pre_order_walk(current_node: head, path: [])
  end

  def self.in_order_search(head:)
    in_order_walk(current_node: head, path: [])
  end

  def self.post_order_search(head:)
    post_order_walk(current_node: head, path: [])
  end

  def self.compare(first:, second:)
    return true if first.nil? && second.nil?
    return false if first.nil? || second.nil?
    return false if first.value != second.value

    compare(first: first.left, second: second.left) && compare(first: first.right, second: second.right)
  end

  private_class_method def self.pre_order_walk(current_node:, path:)
    return path unless current_node

    path << current_node.value
    pre_order_walk(current_node: current_node.left, path: path)
    pre_order_walk(current_node: current_node.right, path: path)
    path
  end

  private_class_method def self.in_order_walk(current_node:, path:)
    return path unless current_node

    in_order_walk(current_node: current_node.left, path: path)
    path << current_node.value
    in_order_walk(current_node: current_node.right, path: path)
    path
  end

  private_class_method def self.post_order_walk(current_node:, path:)
    return path unless current_node

    post_order_walk(current_node: current_node.left, path: path)
    post_order_walk(current_node: current_node.right, path: path)
    path << current_node.value
    path
  end

  private_class_method def self.bfs(head:, needle:)
    return false unless head

    queue = [head]
    until queue.empty?
      current = queue.shift
      return true if current.value == needle

      queue << current.left if current.left
      queue << current.right if current.right
    end
    # if we don't find the value
    false
  end
end

class Node # rubocop:disable Style/Documentation
  attr_accessor :value, :left, :right

  def initialize(value:, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end
