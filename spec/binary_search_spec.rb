require_relative '../algorithms/binary_search'

RSpec.describe BinarySearch do
  let(:arr) { [1,3,5,6,8,9,12,23,34,53,66,67,88] }
  let(:long_arr) do
    100000.times do |i|
      [] << i
    end
  end
  describe ".search" do
    context 'the number is in the array' do
      it 'returns true' do
        expect(subject.search(arr, 53)[0]).to be_truthy
        expect(subject.search(arr, 88)).to be_truthy
        expect(subject.search(arr, 1)[0]).to be_truthy
      end
    end

    context 'the number is not in the array' do
      it 'returns false' do
        expect(subject.search(arr, 0)[0]).to be_falsy
        expect(subject.search(arr, 10)[0]).to be_falsy
        expect(subject.search(arr, 89)[0]).to be_falsy
      end
    end
  end

  describe ".search_recursive" do
    context 'the number is in the array' do
      it 'returns true' do
        expect(subject.search_recursive(arr, 53)).to be_truthy
        expect(subject.search_recursive(arr, 88)).to be_truthy
        expect(subject.search_recursive(arr, 1)).to be_truthy
      end
    end

    context 'the number is not in the array' do
      it 'returns false' do
        expect(subject.search_recursive(long_arr, -1)).to be_falsy
        expect(subject.search_recursive(arr, 10)).to be_falsy
        expect(subject.search_recursive(arr, 89)).to be_falsy
      end
    end
  end

  describe ".index_of_r" do
    context 'the number is in the array' do
      it 'returns the correct index' do
        expect(subject.index_of_r(arr, 53)).to eq(9)
        expect(subject.index_of_r(arr, 88)).to eq(12)
        expect(subject.index_of_r(arr, 1)).to eq(0)
      end
    end

    context 'the number is not in the array' do
      it 'returns false' do
        expect(subject.index_of_r(arr, 0)).to eq(-1)
        expect(subject.index_of_r(arr, 10)).to eq(-1)
        expect(subject.index_of_r(arr, 89)).to eq(-1)
      end
    end
  end
end
