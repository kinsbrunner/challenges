class Ghost
	@@colors = ['white', 'yellow', 'purple', 'red']
	
  attr_accessor :color
  
	def initialize
  	@color = @@colors[rand(@@colors.length)]
  end
end

ghost = Ghost.new
puts ghost.color
ghost2 = Ghost.new
puts ghost2.color
ghost3 = Ghost.new
puts ghost3.color