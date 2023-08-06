require "rspec"
require_relative "../../algorithms/recursion/binary_tree_tools"

RSpec.describe BinaryTreeTools do
  let(:node1) { Node.new(value: 1) }
  let(:node2) { Node.new(value: 2) }
  let(:node3) { Node.new(value: 3) }
  let(:node4) { Node.new(value: 4) }
  let(:node5) { Node.new(value: 5) }
  let(:node6) { Node.new(value: 6) }
  let(:node7) { Node.new(value: 7) }

  before do
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.left = node6
    node3.right = node7
  end

  describe ".breath_first_search" do
    context "when the tree is empty" do
      it "returns false" do
        expect(described_class.breath_first_search(head: nil, needle: 1)).to eq(false)
      end
    end

    context "when the tree has one node" do
      let(:single_node) { Node.new(value: 1) }

      context "and that node is the needle" do
        it "returns true" do
          expect(described_class.breath_first_search(head: single_node, needle: 1)).to eq(true)
        end
      end

      context "and that node is not the needle" do
        it "returns false" do
          expect(described_class.breath_first_search(head: single_node, needle: 2)).to eq(false)
        end
      end
    end

    context "when the tree has multiple nodes" do
      context "and the needle is in the tree" do
        it "returns true" do
          expect(described_class.breath_first_search(head: node1, needle: 2)).to eq(true)
        end
      end

      context "and the needle is not in the tree" do
        it "returns false" do
          expect(described_class.breath_first_search(head: node1, needle: 8)).to eq(false)
        end
      end
    end
  end

  describe ".pre_order_search" do
    context "when the tree is empty" do
      it "returns an empty array" do
        expect(described_class.pre_order_search(head: nil)).to eq([])
      end
    end

    context "when the tree is not empty" do
      it "returns the nodes in the correct pre-order" do
        expect(described_class.pre_order_search(head: node1)).to eq([1, 2, 4, 5, 3, 6, 7])
      end
    end
  end

  describe ".in_order_search" do
    context "when the tree is empty" do
      it "returns an empty array" do
        expect(described_class.in_order_search(head: nil)).to eq([])
      end
    end

    context "when the tree is not empty" do
      it "returns the nodes in the correct in-order" do
        expect(described_class.in_order_search(head: node1)).to eq([4, 2, 5, 1, 6, 3, 7])
      end
    end
  end

  describe ".post_order_search" do
    context "when the tree is empty" do
      it "returns an empty array" do
        expect(described_class.post_order_search(head: nil)).to eq([])
      end
    end

    context "when the tree is not empty" do
      it "returns the nodes in the correct post-order" do
        expect(described_class.post_order_search(head: node1)).to eq([4, 5, 2, 6, 7, 3, 1])
      end
    end
  end
end
