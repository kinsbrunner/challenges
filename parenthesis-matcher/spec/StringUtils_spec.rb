require 'spec_helper'

RSpec.describe StringUtils, type: :model do
  describe "Parenthesis Matcher should work for all the given cases" do
    let(:utils){StringUtils.new}
    
    it "should return False when no string is provided" do
        expect(utils.valid_brackets?(nil)).to eq false
    end
    
    it "should return True when empty string is provided" do
      expect(utils.valid_brackets?("")).to eq true
    end
    
    it "should return True if no brackets" do
      expect(utils.valid_brackets?("Hello World!")).to eq true
    end
    
    it "should return False in case first appears a Closing bracket ')'" do
      expect(utils.valid_brackets?(")(Hello World!)")).to eq false
    end
    
    it "should return False in case it last appears an opening bracket '('" do
      expect(utils.valid_brackets?("(Hello World!)(")).to eq false
    end
    
    it "should return False if single brackets are not put correctly" do
      expect(utils.valid_brackets?("(Hello (World!)")).to eq false
      expect(utils.valid_brackets?("((())")).to eq false
      expect(utils.valid_brackets?("Hello(()(World)")).to eq false
    end    
    
    it "should return True if single brackets are put correctly" do
      expect(utils.valid_brackets?("(Hello World!)")).to eq true
      expect(utils.valid_brackets?("()")).to eq true
      expect(utils.valid_brackets?("Hello()World")).to eq true
    end
    
    it "should return True if multiple brackets are put correctly" do
      expect(utils.valid_brackets?("((Hello World!))")).to eq true
      expect(utils.valid_brackets?("()(())()()")).to eq true
      expect(utils.valid_brackets?("(((()(())()())))")).to eq true
      expect(utils.valid_brackets?("(hello)(dear)(world)")).to eq true
    end
    
  end
end