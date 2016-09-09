class LongestSubsequence
	def find(first, second)
		return nil if first.nil? || second.nil?
		return "" if first.empty? || second.empty?
 
		x, xs, y, ys = first[0..0], first[1..-1], second[0..0], second[1..-1]
		if x == y
			x + find(xs, ys)
		else
			[find(first, ys), find(xs, second)].max_by {|x| x.size}
		end
	end
end