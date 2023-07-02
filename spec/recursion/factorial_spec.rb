require "rspec"
require_relative "../../algorithms/recursion/factorial"

RSpec.describe "factorial" do
  context "when the input is 1" do
    it "returns 1" do
      expect(factorial(1)).to eq(1)
    end
  end

  context "when the input is a positive integer" do
    it "returns the correct factorial" do
      expect(factorial(5)).to eq(120) # 5*4*3*2*1 = 120
      expect(factorial(6)).to eq(720) # 6*5*4*3*2*1 = 720
    end
  end

  context "when the input is less than or equal 0" do
    it "raises an error" do
      expect { factorial(-1) }.to raise_error(StandardError)
    end
  end

  context "when the input is 2" do
    it "returns 2" do
      expect(factorial(2)).to eq(2)
    end
  end
end
