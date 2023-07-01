class Node
  attr_accessor :value, :previous

  def initialize(value)
    @value = value
    @previous = nil
  end
end
