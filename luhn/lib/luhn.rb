module Luhn
  def self.is_valid?(number)
    digits = number.to_s.split("")
    digits.reverse!.map!.with_index {|digit, i| i.odd? ? digit.to_i * 2 : digit.to_i }
    digits.map! {|digit| digit > 9 ? digit - 9 : digit}
    digits.reduce(0, :+) % 10 == 0 ? true : false
  end
end