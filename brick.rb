class Wall

  def relative_amounts(width)
    amounts = []
    iterate_three_ft_count(width, amounts)
    return amounts
  end

  def iterate_three_ft_count(width, amounts)
    (0..(width/3)).each do |i|
      iterate_four_and_half_ft_count(i, width, amounts)
    end
  end

  def iterate_four_and_half_ft_count(i, width, amounts)
    (0..(width/3)).each do |j|
      push_to_array(i, j, width, amounts)
    end
  end

  def push_to_array(i, j, width, amounts)
    if combination_matches_width(i, j, width)
      amounts.push({'4.5': j, '3': i})
    end
  end
 
  def combination_matches_width(three_ft_bricks, four_and_half_ft_bricks, wall_width)
    three_ft_bricks == (-1.5 * four_and_half_ft_bricks + wall_width / 3)
  end

  def row_combination(bricks)
    bricks.each_with_object([]) do |(length, frequency), arr|
      frequency.times {arr.push(length.to_s.to_i)}
    end
  end

  def all_possible_rows(brick_amounts)
    brick_amounts.each_with_object([]) do |bricks, arr|
      one_row_permutations(bricks).each {|combination| arr.push(combination)}
    end
  end

  def one_row_permutations(bricks)
    arr = row_combination(bricks)
    length = arr.length
    arr.permutation(length).to_a.uniq
  end
end