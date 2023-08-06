require "rspec"
require_relative "../data-structures/BinarySearchTree/binary_search_tree"

RSpec.describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  describe '#insert' do
    context 'when the tree is empty' do
      it 'creates a new root node with the given value' do
        tree.insert(10)
        expect(tree.root.value).to eq(10)
      end
    end

    context 'when the tree is not empty' do
      before do
        tree.insert(10)
      end

      it 'correctly inserts a smaller value to the left of root' do
        tree.insert(5)
        expect(tree.root.left.value).to eq(5)
      end

      it 'correctly inserts a larger value to the right of root' do
        tree.insert(15)
        expect(tree.root.right.value).to eq(15)
      end

      it 'correctly inserts a value to the left of a left child' do
        tree.insert(5)
        tree.insert(3)
        expect(tree.root.left.left.value).to eq(3)
      end

      it 'correctly inserts a value to the right of a right child' do
        tree.insert(15)
        tree.insert(20)
        expect(tree.root.right.right.value).to eq(20)
      end
    end
  end
end
