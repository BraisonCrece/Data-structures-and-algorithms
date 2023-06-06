class BinarySearch
  def search(arr, to_find_number)
    start = Time.now
    low = 0
    high = arr.size
    begin
      medium = (low + (high - low) / 2).floor
      value_on_medium_index = arr[medium]
      if value_on_medium_index == to_find_number
        time_end = Time.now
        return [true, ((time_end - start) * 1000).round(3)]
      elsif value_on_medium_index > to_find_number
        high = medium
      else
        low = medium + 1
      end
    end while low < high
    time_end = Time.now
    [false, ((time_end - start) * 1000).round(3)]
  end

  def search_recursive(arr, to_find_number, low = 0, high = arr.size)
    if low >= high
      return false
    end
    medium = (low + (high - low) / 2).floor
    value_on_medium_index = arr[medium]
    if value_on_medium_index == to_find_number
      return true
    elsif value_on_medium_index > to_find_number
      high = medium
    else
      low = medium + 1
    end
    search_recursive(arr, to_find_number, low, high)
  end

  def index_of_r(arr, to_find_number, low = 0, high = arr.size)
    if low >= high
      return -1
    end
    medium = (low + (high - low) / 2).floor
    value_on_medium_index = arr[medium]
    if value_on_medium_index == to_find_number
      return medium
    elsif value_on_medium_index > to_find_number
      high = medium
    else
      low = medium + 1
    end
    index_of_r(arr, to_find_number, low, high)
  end

  def linear_search(arr, to_find_number)
    start = Time.now
    arr.each do |number|
      if to_find_number == number
        time_end = Time.now
        return [true, (time_end - start).round(3)]
      end
    end
    time_end = Time.now
    [false, (time_end - start).round(3)]
  end
end
