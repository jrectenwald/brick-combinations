require_relative 'brick'

class BrickWallCLI
  def initialize
    greeting
  end

  def greeting
    puts "Hello, you can use this tool to calculate the number of ways to build a wall with a given number of 4.5'x1' and 3'x1' bricks." 
    calculate
  end

  def calculate
    wall = Wall.new
    puts "Enter the width of your wall: "
    width = gets.chomp.to_f
    puts "Enter the height of your wall: "
    height = gets.chomp.to_f
    time1 = Time.now
    possibilities = wall.wall_combination_count(width, height)
    time2 = Time.now
    puts "There are #{possibilities} ways to build a #{width}x#{height} wall."
    puts "Runtime: #{time2 - time1}"
    puts "Would you like to calculate the possibilities for a wall with different dimensions?(yes/no)"
    continue = gets.chomp
    calculate if continue.downcase == "yes" || continue.downcase == "y"
  end
end

BrickWallCLI.new