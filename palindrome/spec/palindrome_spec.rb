require 'spec_helper'

RSpec.describe String, type: :model do
  describe "String#palindrome?" do
    
    it "should return true when given an empty string" do
      expect("".palindrome?).to be true
    end
    
    it "should return true when given a one letter string" do
      expect("a".palindrome?).to be true
    end
    
    it "should return true when given the string 'racecar'" do
      expect("racecar".palindrome?).to be true
      expect("  race_car   ".palindrome?).to be true
      expect("race, car.".palindrome?).to be true
    end
    
    it "should differ upper-case from lower-case" do
      expect("raceCAr".palindrome?).to be false
    end
    
    it "should return false when given a non palindromes" do
      expect("yolo".palindrome?).to be false
      expect("swag".palindrome?).to be false
      expect("house".palindrome?).to be false
    end
    
  end
end
