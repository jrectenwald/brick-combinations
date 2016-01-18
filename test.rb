gem 'pry'

require 'pry'
def subset_sum(numbers, target, partial=[])
  (0..(numbers.length - 1)).each do |i|
    n = numbers[i]
    last = partial[-1]
    next_brick = last + n
    puts "pattern: #{partial}" if partial[-1] == target
    count += 1 if partial == target
    return if partial[-1] == target
    if next_brick <= target
      new_array = partial + [last + n]
      subset_sum(numbers, target, new_array)
    end
  end
end

subset_sum([4.5, 3.0], 48, [0])