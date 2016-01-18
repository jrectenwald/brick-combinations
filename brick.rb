require 'pry'
class Wall
  attr_accessor :count

  def initialize
    @count = Count.new
  end

  def relative_amounts(width)
    amounts = []
    iterate_three_ft_count(width, amounts)
    return amounts
  end

  def iterate_three_ft_count(width, amounts)
    (0..width).each do |i|
      iterate_four_and_half_ft_count(i, width, amounts)
    end
  end

  def iterate_four_and_half_ft_count(i, width, amounts)
    (0..width).each do |j|
      push_to_array(i, j, width, amounts)
    end
  end

  def push_to_array(i, j, width, amounts)
    if combination_matches_width(i, j, width)
      amounts.push({'4.5': j, '3': i})
    end
  end
 
  def combination_matches_width(three_ft_bricks, four_and_half_ft_bricks, wall_width)
    three_ft_bricks == (-1.5 * four_and_half_ft_bricks + wall_width / 3.0)
  end

  def row_combination(bricks)
    bricks.each_with_object([]) do |(length, frequency), arr|
      frequency.times {arr.push(length.to_s.to_f)}
    end
  end

  def one_row_permutations(bricks)
    arr = row_combination(bricks)
    length = arr.length
    arr.permutation(length).to_a.uniq
  end

  def all_possible_rows(brick_amounts)
    brick_amounts.each_with_object([]) do |bricks, arr|
      one_row_permutations(bricks).each {|combination| arr.push(combination)}
    end
  end

  def make_row_elements_additive(rows)
    rows.each do |row| 
      row.map!.with_index {|x, i| i > 0 ? row[i] + row[i-1] : row[i]}
      row.delete_at(-1)
    end
    return rows
  end

  def get_additive_rows(width)
    binding.pry
    amounts = relative_amounts(width)
    combinations = all_possible_rows(amounts)
    make_row_elements_additive(combinations)
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
    all_rows = get_additive_rows(width)
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