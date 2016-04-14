class Image
	attr_accessor :data, :rows, :cols
	
	def initialize(vals)
		@data = vals
		@rows = @data.count
		@cols = @data[0].count
	end
	
	def output_image
		@data.each do |line|
			puts line.join(" ")
		end
	end
	
	def blur(n = 1)
		
		n.times do
			on_pixels = []
			@data.each_index do |y|
				subarray = @data[y]
				subarray.each_index do |x|
					#puts "[#{y}] [#{x}] has value #{@data[y][x]}"  if @data[y][x] == 1
					on_pixels.push([y, x]) if @data[y][x] == 1
				end
			end

			on_pixels.each do |position|
				y, x = position
				change_vals(y, x)
			end
		end
	end
	
	private
	
	def change_vals(row, col)
		#Left
		@data[row][col-1] = 1 if col-1 >= 0
		#Right
		@data[row][col+1] = 1	if col+1 <= @cols - 1
		#Up
		@data[row-1][col] = 1 if row-1 >= 0
		#Down
		@data[row+1][col] = 1 if row+1 <= @rows - 1
	end
end


img = Image.new([
	[0, 0, 0, 1, 0, 0, 0], 
	[0, 0, 0, 0, 0, 0, 0], 
	[0, 0, 0, 0, 0, 0, 0], 
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 1, 0, 0, 0]
])
#img.output_image
img.blur(2)
img.output_image