class Wall
  attr_accessor :count

  def initialize
    @count = Count.new
  end

  def one_row_possibilities(brick_lengths, width, walls=[], partial_wall=[])
    brick_lengths.each do |length|
      last_brick_position = partial_wall[-1]
      next_brick_position = last_brick_position + length
      return walls.push(partial_wall[1...-1]) if last_brick_position == width
      if next_brick_position <= width
        next_guess = partial_wall + [next_brick_position]
        one_row_possibilities(brick_lengths, width, walls, next_guess)
      end
    end
    return walls
  end

  def compare_rows(row, row_above)
    similarities = 0
    row.each do |brick| 
      similarities += 1 if row_above.include?(brick) 
      break if similarities == 1
    end
    return similarities
  end

  def build_higher_levels(row, all_rows, height, current_height)
    all_rows.each do |row_above|
      similarities = 0
      similarities = compare_rows(row, row_above)
      if similarities == 0 && height == current_height
        self.count.count += 1
      elsif similarities == 0
        new_height = current_height + 1
        build_higher_levels(row_above, all_rows, height, new_height)
      end
    end
  end

  def wall_combination_count(width, height)
    all_rows = one_row_possibilities([3.0, 4.5], width, [], [0])
    return all_rows.count if height == 1
    all_rows.each {|row| build_higher_levels(row, all_rows, height, 2)}
    return self.count.count
  end
end

class Count
  attr_accessor :count
  def initialize
    @count = 0
  end
end