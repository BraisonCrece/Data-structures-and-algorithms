require_relative '../algorithms/two_crystal_balls'

RSpec.describe TwoCrystalBalls do
  let(:arr) { [false, false, false, false, false, false, false, true, true, true] }
  let(:arr_2) { [false, false, false, false, false, false, false, false, false, true] }
  let(:arr_3) { [false, true, true, true, true, true, true, true, true, true] }
  let(:long_arr) { [false] * 10000 + [true] * 10 }

  describe ".sqr_root_method" do
    context "standard arr" do
      it 'returns the correct index' do
        expect(subject.sqr_root_method(arr)).to eq(7)
        expect(subject.sqr_root_method(arr_2)).to eq(9)
        expect(subject.sqr_root_method(arr_3)).to eq(1)
      end
    end

    context "large arr" do
      it 'returns the correct index' do
        expect(subject.sqr_root_method(long_arr)).to eq(10000)
      end
    end
  end
end
