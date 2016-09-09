require 'spec_helper'

RSpec.describe LongestSubsequence, type: :module do
  describe "LongestSubsequence#find" do
    let(:lcs){LongestSubsequence.new}
    it "should result in nil when given nil" do
      longest = lcs.find(nil, nil)
      expect(longest).to eq nil
    end
    
    it "should result in SPACE when given no common subsequences" do
      longest = lcs.find("a", "b")
      expect(longest).to eq ""
    end
    
    it "should return the longest subsequence when given a short string - test 1" do
      longest = lcs.find("ABCDAF", "ACBCF")
      expect(longest.chars.sort.join).to eq "ABCF"
    end

    it "should return the longest subsequence when given a short string - test 1" do
      longest = lcs.find("thisisatest", "testing123testing")
      expect(longest.chars.join).to eq "tsitest"
    end
  end
end
