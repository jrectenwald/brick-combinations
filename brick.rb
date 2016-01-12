class Wall

  def brick_combinations(width, height)
    
  end

  def ratios(width, height)
    arr = []
    (0..width).each do |i|
      (0..width).each do |j|
        if i == (-1.5 * j + width / 3)
          arr.push({four_and_half_ft: j, three_ft: i})
        end
      end
    end
    return arr
  end

  def row_combination(bricks)
    array = []
    bricks.values[0].times do
      array.push("4.5")
    end
    bricks.values[1].times do
      array.push("3")
    end
    return array
  end

  def all_possible_rows(all_ratios)
    all_ratios.each do |hash|
      
    end
  end

  def one_row_permutations(bricks)
    arr = row_combination(bricks)
    arr.permutation(arr.count).to_a.uniq
  end
end