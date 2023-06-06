require_relative "../algorithms/bubble_sort"

RSpec.describe BubbleSort do
  describe ".bubble_sort" do
    let(:arr) { Array.new(100) { rand(0..100) } }
    let(:one_item_arr) { Array.new(1) }
    let(:one_item_arr_s) { subject.bubble_sort(one_item_arr) }
    let(:sorted_arr) { arr.sort }
    let(:bubble_sorted) { subject.bubble_sort(arr) }

    it "returns the array sorted" do
      expect(bubble_sorted).to eq(sorted_arr)
      expect(one_item_arr_s).to eq(one_item_arr)
    end
  end
end
