class BubbleSort
  def bubble_sort(arr)
    return arr if arr.size < 2

    (0..arr.size).each do |i|
      # The "- i" on the bucle definition below is used
      # to avoid unnecessary comparisons
      # with elements that are already sorted.
      (0...arr.size - 1 - i).each do |j|
        if arr[j] > arr[j + 1]
          arr[j], arr[j + 1] = arr[j + 1], arr[j]
        end
      end
    end

    arr
  end
end
