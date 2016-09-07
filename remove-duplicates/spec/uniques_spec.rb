require 'spec_helper'

RSpec.describe Uniques, type: :model do
  describe "class should work" do
    it "should remove duplicates" do
      input = [2, 3, 4, 5, 5, 6, 7, 6, 7, 1, 8, 2, 3, 4, 5, 2, 3]
      expected = [2, 3, 4, 5, 6, 7, 1, 8]
      u = Uniques.new
      expect(u.cleanup(input)).to eq expected
    end
  end
end