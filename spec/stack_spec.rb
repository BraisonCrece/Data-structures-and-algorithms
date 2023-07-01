require_relative "../data-structures/Stack/Stack"

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe "#initialize" do
    it "creates an empty stack" do
      expect(stack.length).to eq(0)
      expect(stack.peek).to be_nil
    end
  end

  describe "#push" do
    it "pushes an item to the stack" do
      stack.push("test")
      expect(stack.length).to eq(1)
      expect(stack.peek).to eq("test")
    end

    it "returns the updated stack" do
      result = stack.push("test")
      expect(result).to eq(stack)
    end

    it "correctly orders multiple items" do
      stack.push("test1")
      stack.push("test2")
      expect(stack.peek).to eq("test2")
      expect(stack.length).to eq(2)
    end
  end

  describe "#pop" do
    it "returns nil if stack is empty" do
      expect(stack.pop).to be_nil
    end

    it "removes and returns the top item from the stack" do
      stack.push("test")
      expect(stack.pop).to eq("test")
      expect(stack.length).to eq(0)
    end
  end

  describe "#peek" do
    it "returns nil if stack is empty" do
      expect(stack.peek).to be_nil
    end

    it "returns the top item without removing it from the stack" do
      stack.push("test")
      expect(stack.peek).to eq("test")
      expect(stack.length).to eq(1)
    end
  end

  describe "#inspect" do
    it "displays the stack correctly" do
      stack.push("test1")
      stack.push("test2")
      expect(stack.inspect).to eq("Stack: {values: test1, test2, length: 2}")
    end

    it "displays an empty stack correctly" do
      expect(stack.inspect).to eq("Stack: {values: , length: 0}")
    end
  end
end
