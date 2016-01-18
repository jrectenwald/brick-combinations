gem 'pry'

require 'pry'

arr = []

def subset_sum(numbers, target, arr, partial=[])
  (0..(numbers.length - 1)).each do |i|
    n = numbers[i]
    last = partial[-1]
    next_brick = last + n
    arr.push(partial) if partial[-1] == target
    count += 1 if partial == target
    return if partial[-1] == target
    if next_brick <= target
      new_array = partial + [last + n]
      subset_sum(numbers, target, arr, new_array)
    end
  end
  return arr
end

subset_sum([4.5, 3.0], 48, arr, [0])