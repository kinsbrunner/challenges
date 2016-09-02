require 'minitest/autorun'
# The New York Lottery has a game called Numbers which requires that a player choose 3 numbers from 0 to 9
# Players may choose from several wager types, each with different winning conditions.
# Just recently they added a new wager-type called Close-Enough which you can read about here
# http://nylottery.ny.gov/wps/portal/Home/Lottery/Home/Daily+Games/NUMBERS/Numbers+-+Chances+of+Winning
# For this problem you will be implementing a method to generate all the possible winning combinations
# of a set of numbers.
#
# For example:
#
# If the player chooses the numbers [4, 3, 4] then they are considered winners in the event that the result numbers have:
# 1 digit one off   ex. [3, 3, 4] [4, 2, 4] [4, 3, 3]
#                       [4, 3, 5] [4, 4, 4] [5, 3, 4]
#                     
# 2 digits one off  ex. [3, 2, 4] [3, 3, 3] [3, 3, 5]
#                       [3, 4, 4] [4, 2, 3] [4, 2, 5]
#                       [4, 4, 3] [4, 4, 5] [5, 2, 4]
#                       [5, 3, 3] [5, 3, 5] [5, 4, 4]
#                      
# 3 digits one off  ex. [3, 2, 3] [3, 2, 5] [3, 4, 2] 
#                       [3, 4, 5] [5, 2, 3] [5, 2, 5] 
#                       [5, 4, 3] [5, 4, 5]
#
# In addition if a player chooses the numbers 0 or 9 those numbers rollover such that
# [0, 1, 9] are a winner if [9, 1, 9] or [0, 1, 0] are the result numbers
#
# The New York Lottery also has another game called Win 4. It works just like Numbers except players choose 4 numbers instead of 3. 
#  
# Your task:
#
# 1) Write the body of the generate_combinations function that takes an array of numbers and an amount of one offs 
#    then returns all the possible combinations of those numbers
#
# 2) Write the body of the winner? function that accepts a players numbers and a result numbers and
#    returns whether they are winners.
#
# You can complete this problem using only Ruby's standard library. Your solution should be flexible enough to handle
# both Numbers and Win 4 as well as a new game that functions the same way but with even more numbers. 
#
# Run this file with ruby close_enough.rb
#
# Feel free to contact us for any help

class CloseEnough
  def self.winner?(player_numbers, result_numbers)
    result_numbers.each_index do |i|
      return true if generate_combinations(result_numbers, i+1).include?(player_numbers)
    end
    false
  end

  def self.generate_combinations(ns, n)
    pre = ns.map{ |num| num != 0 ? num-1 : 9 }
    nex = ns.map{ |num| num != 9 ? num+1 : 0 }
    alternatives = pre.zip(ns, nex)
    
#   Get all the existing possibilities ignoring the off-digits    
    combinations = alternatives[0].product(*alternatives[1..-1])

    combinations.delete_if do |comb|
      comb.zip(ns).select{ |x, y| x != y }.length != n
    end  
  end
  
  def self.generate_combinations(ns, n)
    #pre = ns.map{ |num| num != 0 ? num-1 : 9 }
    pre = ns.map{ |n| (n - 1) % 10 }
    #nex = ns.map{ |num| num != 9 ? num+1 : 0 }
    nex = ns.map{ |n| (n + 1) % 10 }
    
    alternatives = pre.zip(ns, nex)
    
    puts pre.inspect
    puts nex.inspect
    
  end
end

CloseEnough.generate_combinations([0,1,2], 1)
CloseEnough.generate_combinations([7,8,9], 1)

=begin
class TestCloseEnough < Minitest::Test
  def test_3_one_digit_one_off
    assert_equal(
      [
        [1, 1, 2], [9, 1, 2], 
        [0, 2, 2], [0, 0, 2], 
        [0, 1, 3], [0, 1, 1]
      ] - CloseEnough.generate_combinations([0,1,2], 1),
      []
    )
  end

  def test_4_one_digit_one_off
    assert_equal(
      [
        [1, 1, 2, 3], [9, 1, 2, 3], 
        [0, 2, 2, 3], [0, 0, 2, 3], 
        [0, 1, 3, 3], [0, 1, 1, 3], 
        [0, 1, 2, 4], [0, 1, 2, 2]
      ] - CloseEnough.generate_combinations([0,1,2,3], 1),
      []
    )
  end

  def test_3_two_digit_one_off
    assert_equal(
      [
        [1, 2, 2], [1, 0, 2], [9, 2, 2], 
        [9, 0, 2], [1, 1, 3], [1, 1, 1], 
        [9, 1, 3], [9, 1, 1], [0, 2, 3], 
        [0, 2, 1], [0, 0, 3], [0, 0, 1]
      ] - CloseEnough.generate_combinations([0,1,2], 2),
      []
    )
  end

  def test_4_two_digit_one_off
    assert_equal(
      [
        [1, 1, 3, 3], [1, 1, 1, 3], [9, 1, 3, 3], [9, 1, 1, 3], 
        [1, 2, 2, 3], [1, 0, 2, 3], [9, 2, 2, 3], [9, 0, 2, 3], 
        [1, 1, 2, 4], [1, 1, 2, 2], [9, 1, 2, 4], [9, 1, 2, 2], 
        [0, 2, 3, 3], [0, 2, 1, 3], [0, 0, 3, 3], [0, 0, 1, 3], 
        [0, 2, 2, 4], [0, 2, 2, 2], [0, 0, 2, 4], [0, 0, 2, 2], 
        [0, 1, 3, 4], [0, 1, 3, 2], [0, 1, 1, 4], [0, 1, 1, 2]
      ] - CloseEnough.generate_combinations([0,1,2,3], 2),
      []
    )
  end

  def test_4_three_digit_one_off
    assert_equal(
      [
        [1, 2, 3, 3], [1, 2, 1, 3], [1, 0, 3, 3], [1, 0, 1, 3], 
        [9, 2, 3, 3], [9, 2, 1, 3], [9, 0, 3, 3], [9, 0, 1, 3], 
        [1, 2, 2, 4], [1, 2, 2, 2], [1, 0, 2, 4], [1, 0, 2, 2], 
        [9, 2, 2, 4], [9, 2, 2, 2], [9, 0, 2, 4], [9, 0, 2, 2], 
        [1, 1, 3, 4], [1, 1, 3, 2], [1, 1, 1, 4], [1, 1, 1, 2], 
        [9, 1, 3, 4], [9, 1, 3, 2], [9, 1, 1, 4], [9, 1, 1, 2], 
        [0, 2, 3, 4], [0, 2, 3, 2], [0, 2, 1, 4], [0, 2, 1, 2], 
        [0, 0, 3, 4], [0, 0, 3, 2], [0, 0, 1, 4], [0, 0, 1, 2]
      ] - CloseEnough.generate_combinations([0,1,2,3], 3),
      []
    )
  end

  def test_4_four_digit_one_off
    assert_equal(
      [
        [2, 2, 2, 2], [2, 2, 2, 0], [2, 2, 0, 2], [2, 2, 0, 0], 
        [2, 0, 2, 2], [2, 0, 2, 0], [2, 0, 0, 2], [2, 0, 0, 0], 
        [0, 2, 2, 2], [0, 2, 2, 0], [0, 2, 0, 2], [0, 2, 0, 0], 
        [0, 0, 2, 2], [0, 0, 2, 0], [0, 0, 0, 2], [0, 0, 0, 0]
      ] - CloseEnough.generate_combinations([1,1,1,1], 4),
      []
    )
  end

  [
    [0, 1, 4], [1, 1, 9], false,
    [0, 1, 2], [0, 1, 3], true,
    [1, 2, 2], [1, 3, 2], true,
    [3, 4, 7], [3, 4, 7], false,
    [9, 2, 6], [9, 2, 4], false,
    [9, 2, 6], [0, 2, 6], true,
    [4, 4, 4], [5, 5, 4], true,
    [4, 4, 4], [5, 4, 4], true,
    [9, 9, 9], [8, 9, 9], true,
    [9, 9, 9], [0, 9, 9], true,
    [3, 2, 1], [1, 2, 3], false,
    [7, 1, 7], [7, 0, 7], true,
    [1, 2, 3, 4], [0, 3, 3, 4], true,
    [3, 3, 8, 8], [4, 2, 6, 8], false,
    [2, 1, 3, 2], [1, 0, 4, 1], true,
    [0, 0, 0, 0], [1, 9, 1, 9], true,
    [9, 9, 9, 9], [9, 9, 9, 1], false,
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 0], [0, 2, 4, 4, 4, 6, 8, 8, 8, 0], true,
    [1], [2], true,
    [0], [2], false
  ].each_slice(3).each_with_index do |(player, result, is_winner), index|
    define_method("test_winner_case_#{index}") do
      assert_equal(is_winner, CloseEnough.winner?(player, result))
    end
  end
end
=end