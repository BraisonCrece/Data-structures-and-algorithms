class BinarySearchTree
  # binary search tree,
  # for any given node:
  #   all nodes in its left subtree are less than node
  #   all nodes in its right subtree are greater than node
  attr_accessor :root

  def insert(value)
    if root.nil?
      self.root = Node.new(value: value)
    else
      insert_node(current_node: root, value: value)
    end
  end

  private

  def insert_node(current_node:, value:)
    if value <= current_node.value
      if current_node.left.nil?
        current_node.left = Node.new(value: value)
      else
        insert_node(current_node: current_node.left, value: value)
      end
    else
      if current_node.right.nil?
        current_node.right = Node.new(value: value)
      else
        insert_node(current_node: current_node.right, value: value)
      end
    end
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
