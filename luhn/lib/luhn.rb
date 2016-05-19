module Luhn
  def self.is_valid?(number)
    digits = []
    reverse = []
#   Step 1 - break the credit card into it's individual digits.
    digits = number.to_s.split("")

#   Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.).
#   Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
    reverse = digits.reverse
    reverse.each_with_index do | item, i | 
      if (i % 2 != 0) then 
        reverse[i] = item.to_i * 2 
        if reverse[i] >= 10 
          reverse[i] = reverse[i] - 9
        end
      end
    end

#   Step 4 - Sum the digits.
    sum = reverse.inject(0){|sum,x| sum + x.to_i }

#   Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.
    if sum % 10 == 0
      return true
    else
      return false
    end
  end
end