require 'spec_helper'

RSpec.describe String, type: :model do
  describe "String#rot13" do

    it "should be return an empty string when given an empty string" do
      expect("".rot13).to eq ""
    end

    it "should be ciphered when given a one letter string" do
      expect("a".rot13).to eq "n"
    end

    it "should keep the capitalization when given a set of capital and lowercase letters" do
      expect("aB".rot13).to eq "nO"
    end

    it "should cipher the entire string when given a string" do
      expect("Julius ATTACK Gaul Now".rot13).to eq "Whyvhf NGGNPX Tnhy Abj"
    end

    it "should result in the same string when given two transformations" do
      str = "Julius ATTACK Gaul Now"
      expect(str.rot13.rot13).to eq str
    end
    
  end
end
