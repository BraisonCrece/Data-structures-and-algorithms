require_relative '../data-structures/Queue/Queue'

RSpec.describe Queue do
  let(:queue) { Queue.new }

  it 'initializes an empty Queue' do
    expect(queue.length).to eq(0)
    expect(queue.head).to be_nil
    expect(queue.tail).to be_nil
  end

  describe '#enqueue' do
    it 'adds a value to an empty queue' do
      queue.enqueue('First')
      expect(queue.length).to eq(1)
      expect(queue.head.value).to eq('First')
      expect(queue.tail.value).to eq('First')
    end

    it 'adds a value to a non-empty queue' do
      queue.enqueue('First')
      queue.enqueue('Second')
      expect(queue.length).to eq(2)
      expect(queue.head.value).to eq('First')
      expect(queue.tail.value).to eq('Second')
      expect(queue.head.next_node.value).to eq('Second')
    end
  end

  describe '#dequeue' do
    it 'removes a value from the queue' do
      queue.enqueue('First')
      queue.enqueue('Second')
      expect(queue.dequeue).to eq('First')
      expect(queue.length).to eq(1)
      expect(queue.head.value).to eq('Second')
      expect(queue.tail.value).to eq('Second')
    end

    it 'returns a message when trying to dequeue from an empty queue' do
      expect(queue.dequeue).to eq("THE QUEUE IS EMPTY")
    end
  end

  describe '#peek' do
    it 'returns the value of the head node' do
      queue.enqueue('First')
      expect(queue.peek).to eq('First')
    end

    it 'returns a message when trying to peek at an empty queue' do
      expect(queue.peek).to eq("THE QUEUE IS EMPTY")
    end
  end
end
