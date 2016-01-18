#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
gem 'pry'
require 'minitest/autorun'

require_relative 'brick'

class TestMeme < Minitest::Test
  def setup
    @wall = Wall.new
  end
  
  def test_seven_point_five_by_one_feet
    assert_equal 2, @wall.wall_combination_count(7.5, 1)
  end

  def test_seven_point_five_by_two_feet
    assert_equal 2, @wall.wall_combination_count(7.5, 2)
  end

  def test_twelve_by_three_feet
    assert_equal 4, @wall.wall_combination_count(12, 3)
  end

  def test_twenty_seven_by_five_feet
    assert_equal 7958, @wall.wall_combination_count(27, 5)
  end
end