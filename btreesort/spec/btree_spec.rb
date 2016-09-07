require 'spec_helper'

RSpec.describe BTreeSort, type: :model do
  describe 'btree sort should work' do
    let(:tree) {btree = BTreeSort.new(nil, nil, nil)}
    it 'should order the array' do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]
      expect(tree.sort(array)).to eq expected
    end
  end
end