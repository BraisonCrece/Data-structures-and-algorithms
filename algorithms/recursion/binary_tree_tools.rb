class BinaryTreeTools
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

  def self.compare(a:, b:)
    return true if a == nil && b == nil
    return false if a == nil || b == nil
    return false if a.value != b.value

    return compare(a: a.left, b: b.left) && compare(a: a.right, b: b.right)
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

class Node
  attr_accessor :value, :left, :right

  def initialize(value:, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end
end
