#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'brick'

class TestMeme < Minitest::Test
  def setup
    @wall = Wall.new
  end

  def test_rows_above
    assert_equal 1, @wall.brick_combinations(7.5, 1)
  end

  # def test_seven_point_five_by_one_feet
  #   assert_equal 2, @wall.brick_combinations(7.5, 1)
  # end

  # def test_seven_point_five_by_two_feet
  #   assert_equal 2, @wall.brick_combinations(7.5, 2)
  # end

  # def test_twelve_by_three_feet
  #   assert_equal 4, @wall.brick_combinations(12, 3)
  # end

  # def test_twenty_seven_by_five_feet
  #   assert_equal 7958, @wall.brick_combinations(27, 5)
  # end
end