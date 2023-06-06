class TwoCrystalBalls
  def sqr_root_method(arr)
    save_point = 0
    first_break_point = 0
    arr_length_srq_root = Math.sqrt(arr.length).floor

    (0..arr.length).step(arr_length_srq_root) do |index|
      if arr[index] == true
        first_break_point = index
        break
      else
        save_point = index
      end
    end

    (save_point..first_break_point).each do |index|
      if arr[index]
        return index
      end
    end
  end
end
