require_relative "../algorithms/quick_sort"

RSpec.describe QuickSort do
  context "Unordered Array" do
    let!(:unordered_array) { [98, 2, 43, 23, 12, 6, 32, 7, 6, 5, 99, 109] }
    let!(:ordered_array) { [2, 5, 6, 6, 7, 12, 23, 32, 43, 98, 99, 109] }

    it "returns an ordered array" do
      expect { described_class::quick_sort(unordered_array) }.to change { unordered_array }.to(ordered_array)
    end
  end
end
