module WordCounter

	def self.count(string)
		return nil if string.nil? || string.empty?
		
		string.downcase!
		string.gsub!("\n", ' ')
		string.gsub!(/[.,?()]/, '')
		words = string.split(" ")
		words.inject(Hash.new(0)) {|h, v| h[v] += 1; h }
	end

end
=begin
string = "Oops I did it again, I played with your heart, and lost it again, oh babe babe"
result = WordCounter.count(string)
puts result.inspect
=end