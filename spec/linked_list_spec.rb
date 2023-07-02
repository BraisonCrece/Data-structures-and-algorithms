require_relative "../data-structures/LinkedList/linked_list"
require "byebug"
RSpec.describe LinkedList do
  let(:linked_list) { LinkedList.new }

  describe "#add" do
    it "adds a value to the linked list" do
      expect(linked_list.add("First Value")).to eq "success"
      expect(linked_list.head.value).to eq "First Value"
      expect(linked_list.tail.value).to eq "First Value"
    end
  end

  describe "#get" do
    it "gets the value at a given index" do
      linked_list.add("First Value")
      linked_list.add("Second Value")
      expect(linked_list.get(1)).to eq "Second Value"
    end

    it "returns error message if index out of bounds" do
      expect(linked_list.get(10)).to eq "INDEX 10 OUT OF BOUNDS"
    end
  end

  describe "#replace" do
    before do
      linked_list.add("First Value")
      linked_list.add("Second Value")
    end

    it "replaces the value at a given index" do
      linked_list.replace(1, "New First Value")
      expect(linked_list.get(1)).to eq "New First Value"
    end

    it "returns error message if index out of bounds" do
      expect(linked_list.replace(10, "New Value")).to eq "INDEX 10 OUT OF BOUNDS"
    end
  end

  describe "#remove" do
    before do
      linked_list.add("First Value")
      linked_list.add("Second Value")
    end

    it "removes the value at a given index" do
      linked_list.remove(0)
      expect(linked_list.get(0)).to eq "Second Value"
    end

    it "returns error message if index out of bounds" do
      expect(linked_list.remove(10)).to eq "INDEX 10 OUT OF BOUNDS"
    end
  end

  describe "#inspect" do
    before do
      linked_list.add("First Value")
      linked_list.add("Second Value")
    end

    it "prints the linked list" do
      expect(linked_list.inspect).to eq ["First Value", "Second Value"]
    end
  end

  describe "#size" do
    it "returns the size of the linked list" do
      linked_list.add("First Value")
      linked_list.add("Second Value")
      linked_list.add("Third Value")
      expect(linked_list.size).to eq 3
    end

    it "returns 0 if the linked list is empty" do
      expect(linked_list.size).to eq 0
    end
  end
end
