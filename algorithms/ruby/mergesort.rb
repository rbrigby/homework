# breaks the array down into 2 numbers (number A and number B) and sorts them
def merge_sort(list)
  if list.length <= 1
    return list
  end
  list_size = list.size
  half_list_size = (list_size / 2).round

  left_array = list.take(half_list_size)
  right_array = list.drop(half_list_size)

  sorted_left_arr = merge_sort(left_array)
  sorted_right_arr = merge_sort(right_array)

  merge(sorted_left_arr, sorted_right_arr)
end

# this creates a new array, loops through left/right arrays and places the lowest number into the array
def merge(left_array, right_array)
  if right_array.empty?
    return left_array # We have nothing to compare. Left wins.
  end

  if left_array.empty?
    return right_array # We have nothing to compare. Right wins.
  end

  smallest_number = if left_array.first <= right_array.first
    left_array.shift # shift/unshift are the opposite of pop/push and work on the front of the array
  else
    right_array.shift
  end

  # We keep doing it until the left or right array is empty.
  recursive = merge(left_array, right_array)

  # Okay, either left or right array are empty at this point. So we have a result.
  [smallest_number].concat(recursive)
end

arr1 = [4, 1, 5, 1, 33, 312, 99, 88, 1000, 3000]
puts "array1: #{arr1}"
puts merge_sort(arr1)


# ultra compressed version in 7 lines
def merge_sort_compressed(arr)
  return arr unless arr.size > 1
    mid = arr.size/2
      a, b, sorted = merge_sort_compressed(arr[0...mid]), merge_sort_compressed(arr[mid..-1]), []
    sorted << (a[0] < b[0] ? a.shift : b.shift) while [a,b].none?(&:empty?)
  sorted + a + b
end

arr2 = [4, 92, 1, 39, 19, 93, 49, 10]
puts "array2: #{arr2}"
h = merge_sort_compressed(arr2)
puts h
