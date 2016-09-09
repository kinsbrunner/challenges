class String
	def palindrome?
		return true if self.empty?
		self.remove_non_letters
		return true if self.length == 1
		
		len = self.length
		half = (len / 2).floor
		word_1 = self[0..half-1]
		word_2 = len % 2 == 0 ? self[half..len-1].reverse : self[half+1..len-1].reverse
		return true if word_1 == word_2
		
		return false
	end
	
	def remove_non_letters
		self.strip!
		self.gsub!(/[^a-zA-Z]/, '') if !self.nil?
	end
end