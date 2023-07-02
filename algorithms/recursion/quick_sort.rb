class QuickSort
  def self.quick_sort(arr)
    qs(arr, 0, arr.size - 1)
  end

  def self.qs(arr, lo, hi)
    return if lo >= hi
    pivot_idx = partition(arr, lo, hi)
    qs(arr, lo, pivot_idx - 1)
    qs(arr, pivot_idx + 1, hi)
  end

  def self.partition(arr, lo, hi)
    pivot = arr[hi]
    pivot_idx = lo - 1
    (lo..hi - 1).each do |index|
      if arr[index] <= pivot
        pivot_idx += 1
        arr[index], arr[pivot_idx] = arr[pivot_idx], arr[index]
      end
    end
    pivot_idx += 1
    arr[pivot_idx], arr[hi] = arr[hi], arr[pivot_idx]
    return pivot_idx
  end

  private_class_method :qs, :partition
end
