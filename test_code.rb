 def wall_combination_count(width, height)
    count = 0
    all_rows = get_additive_rows(width)
    all_rows.each do |row1|
      all_rows.each do |row2|
        similarities = 0
        row1.each do |brick1| 
          similarities += 1 if row2.include?(brick1)
        end
        if similarities == 0
          all_rows.each do |row3|
            similarities = 0
            row2.each do |brick2|
              similarities += 1 if row3.include?(brick2)
            end
            if similarities == 0
              all_rows.each do |row4|
                similarities = 0
                row3.each do |brick3|
                  similarities += 1 if row4.include?(brick3)
                end
                if similarities == 0
                  all_rows.each do |row5|
                    similarities = 0
                    row4.each do |brick4|
                      similarities += 1 if row5.include?(brick4)
                    end
                    if similarities == 0
                      count += 1
                    end
-> return count

def iterate(row, all_rows, height, current_height)
  all_rows.each do |row_above|
    similarities = 0
    row.each {|brick| similarities += 1 if row_above.include?(brick) }
    if similarities == 0 && height == current_height
      self.count.count += 1
    elsif similarities == 0
      current_height += 1
      iterate(row_above, all_rows, height, current_height)
    end
  end
end