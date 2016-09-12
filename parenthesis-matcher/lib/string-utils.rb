class StringUtils
	def valid_brackets?(string)
		return false if string.nil?
		return true if string.empty?
		
		string.gsub!(/[^()]/, '')
    letters = string.chars
		return false if letters[0] == ')' || letters[-1] == '(' 

		left = 0
		right = 0
		letters.each do |bracket|
			return false if right > left
			left += 1 if bracket == '('
			right += 1 if bracket == ')'
		end
		
		left == right ? true : false
	end
end