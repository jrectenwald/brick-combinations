class Wall
  def one_row_possibilities(brick_lengths, width, all_possible_rows=[], partial_wall=[])
    brick_lengths.each do |length|
      last_brick_position = partial_wall[-1]
      next_brick_position = last_brick_position + length
      return all_possible_rows.push(partial_wall[1...-1]) if last_brick_position == width
      if next_brick_position <= width
        next_guess = partial_wall + [next_brick_position]
        one_row_possibilities(brick_lengths, width, all_possible_rows, next_guess)
      end
    end
    all_possible_rows
  end

  def compatible?(row, row_above)
    row.each {|brick| return false if row_above.include?(brick)}
    true
  end

  def matchups(all_rows)
    all_rows.each_with_object({}) do |row_below, matchups_hash|
      all_rows.each do |row_above|
        if compatible?(row_below, row_above)
          matchups_hash.has_key?(row_below) ? matchups_hash[row_below].push(row_above) : matchups_hash[row_below] = [row_above]
        end
      end
    end
  end

  def build_higher_levels(row, matchups_hash, height, current_height, count=0)
    matchups_hash[row].each do |row_above|
      if (height - 1) == current_height
        count += matchups_hash[row_above].count
      else
        count += build_higher_levels(row_above, matchups_hash, height, (current_height + 1))
      end
    end
    count
  end

  def two_foot_wall_count(matchups_hash, count=0)
    matchups_hash.each {|row_below, compatible_rows| count += compatible_rows.count}
    count
  end
  
  def wall_combination_count(width, height, count=0)
    all_rows = one_row_possibilities([3.0, 4.5], width, [], [0])
    return all_rows.count if height == 1
    matchups_hash = matchups(all_rows)
    return two_foot_wall_count(matchups_hash, count) if height == 2
    all_rows.each {|row| count += build_higher_levels(row, matchups_hash, height, 2)}
    count
  end
end