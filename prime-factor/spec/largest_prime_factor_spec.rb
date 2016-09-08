require 'spec_helper'

RSpec.describe LargestPrimeFactor, type: :model do
  describe "LargestPrimeFactor#largest_prime_of" do
    
    it "should result in nil when given nil" do
      number = nil
      find = LargestPrimeFactor.new
      largestprime = find.largest_prime_of(number)
      expect(largestprime).to eq nil
    end

    it "should give the largest prime when given a small number" do
      number = 10
      find = LargestPrimeFactor.new
      largestprime = find.largest_prime_of(number)
      expect(largestprime).to eq 5
    end

    it "should give the largest prime when given a large number" do
      number = 13195
      find = LargestPrimeFactor.new
      largestprime = find.largest_prime_of(number)
      expect(largestprime).to eq 29
    end

  end
end
