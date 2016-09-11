require 'spec_helper'

RSpec.describe ArrayUtils, type: :module do
  describe "ArrayUtils#insertion_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.insertion_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.insertion_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end

  describe "ArrayUtils#selection_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.selection_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.selection_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
  
  describe "ArrayUtils#merge_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.merge_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.merge_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
=begin
  describe "ArrayUtils#heap_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.heap_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.heap_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
=end
  describe "ArrayUtils#quicksort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.quicksort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.quicksort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
  
  describe "ArrayUtils#bubble_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.bubble_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.bubble_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
=begin
  describe "ArrayUtils#btree_sort" do
    it "should sort an array of integers" do
      expect(ArrayUtils.btree_sort([])).to eq []

      input = [7, 3, 1, 9, 4, 2, 99, 18, 2]
      expect(ArrayUtils.btree_sort(input)).to eq [1, 2, 2, 3, 4, 7, 9, 18, 99]
    end
  end
=end
end