class Uniques
  def initialize
    @numbers = []
  end
  
  def cleanup(array)
    uniques = []
    array.map{|num| uniques << num if !uniques.include?(num)}
    uniques
  end
end