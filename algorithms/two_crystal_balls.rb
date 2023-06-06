class TwoCrystalBalls
  # Returns the first breaking point in a given array
  def sqr_root_method(arr)
    save_point = 0
    first_break_point = 0

    # Compute the step size as the square root of the array length
    step_size = Math.sqrt(arr.length).floor

    # Check every step_size'th element for breakage
    (0..arr.length).step(step_size) do |index|
      if arr[index] == true
        first_break_point = index
        break
      else
        save_point = index
      end
    end
    # Check the elements between save_point and first_break_point for breakage
    (save_point..first_break_point).each do |index|
      if arr[index]
        return index
      end
    end
    # If no breakage point is found, return nil
    nil
  end
end
