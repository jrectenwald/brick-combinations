class Wall
  attr_accessor :count

  def initialize
    @count = Count.new
  end

  def subset_sum(numbers, target, arr=[], partial=[])
    (0..(numbers.length - 1)).each do |i|
      n = numbers[i]
      last = partial[-1]
      next_brick = last + n
      arr.push(partial[1...-1]) if partial[-1] == target
      return if partial[-1] == target
      if next_brick <= target
        new_array = partial + [last + n]
        subset_sum(numbers, target, arr, new_array)
      end
    end
    return arr
  end

  def iterate(row, all_rows, height, current_height)
    all_rows.each do |row_above|
      similarities = 0
      row.each {|brick| similarities += 1 if row_above.include?(brick) }
      if similarities == 0 && height == current_height
        self.count.count += 1
      elsif similarities == 0
        new_height = current_height + 1
        iterate(row_above, all_rows, height, new_height)
      end
    end
  end

  def wall_combination_count(width, height)
    all_rows = subset_sum([3.0, 4.5], width, [], [0])
    return all_rows.count if height == 1
    all_rows.each {|row| iterate(row, all_rows, height, 2)}
    return self.count.count
  end
end

class Count
  attr_accessor :count
  def initialize
    @count = 0
  end
end