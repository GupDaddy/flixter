class Image
	
	def initialize(pixel)
		@Images = Array.new(pixel)
	end

	def find_ones
		ones = []
		total_rows = @Images.length - 1
		@Images.each_with_index do |row,row_num|
			total_cols = row.length - 1
			row.each_with_index do |item,col_num|
				if item == 1
					x = y = @Distance
					# y = @Distance
					(0..x).each do |x|
						(0..y).each do |y|
							if col_num + y <= total_cols
								ones_sub = []
								ones_sub.push(row_num,col_num + y)
								ones.push(ones_sub)
							end
							if col_num - y >= 0
								ones_sub = []
								ones_sub.push(row_num,col_num - y)
								ones.push(ones_sub)
							end
							if row_num + x <= total_rows && col_num + y <= total_cols
								ones_sub = []
								ones_sub.push(row_num + x,col_num + y)
								ones.push(ones_sub)
							end
							if row_num - x >= 0 && col_num - y >= 0
								ones_sub = []
								ones_sub.push(row_num - x,col_num - y)
								ones.push(ones_sub)
							end
							if row_num + x <= total_rows && col_num - y >= 0
								ones_sub = []
								ones_sub.push(row_num + x,col_num - y)
								ones.push(ones_sub)
							end
							if row_num - x >= 0 && col_num + y <= total_cols
								ones_sub = []
								ones_sub.push(row_num - x,col_num + y)
								ones.push(ones_sub)
							end
						end
						y -= 1
					end
				end
			end
		end
		ones
	end

	def blur(distance)
		@Distance =  distance
	end

	def blur_image
		ones = find_ones
		@Images.each_with_index do |row,row_num|
			row.each_with_index do |item,col_num|
				ones.each do |found_row,found_col|
					if row_num == found_row && col_num == found_col
						@Images[found_row][found_col] = 1
					end
				end
			end
		end
	end

	def output_image
		@Images.each do |cell|
			puts cell.join
		end
	end
end

image = Image.new([
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1],
])

image.blur(3)
image.blur_image
image.output_image