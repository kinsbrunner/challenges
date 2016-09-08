class String
  def rot13
    self.chars.map{|letter| convert(letter)}.join
  end
  
  private
  
  @@letters_1 =  ('a'..'m').to_a + ('A'..'M').to_a
  @@letters_2 =  ('n'..'z').to_a + ('N'..'Z').to_a
  
  def convert(letter)
    return letter if letter.eql?(" ")
    
    if    letter =~ /[a-z]/ && @@letters_1.include?(letter) 
      return @@letters_2[@@letters_1.index(letter)]  
    elsif letter =~ /[A-Z]/ && @@letters_1.include?(letter)
      return @@letters_2[@@letters_1.index(letter)].upcase
    elsif letter =~ /[a-z]/ && @@letters_2.include?(letter)
      return @@letters_1[@@letters_2.index(letter)]
    elsif letter =~ /[A-Z]/ && @@letters_2.include?(letter)
      return @@letters_1[@@letters_2.index(letter)].upcase
    end
  end
end