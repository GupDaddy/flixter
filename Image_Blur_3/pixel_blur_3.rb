class Image
	
	def initialize(pixel)
		@Images = Array.new(pixel)
	end

	def find_ones
		# image_blur = @Images
		ones = []
		@Images.each_with_index do |row,row_num|
			row.each_with_index do |item,col_num|
				if item == 1
					ones_sub = []
					ones_sub.push(row_num,col_num)
					ones.push(ones_sub)
				end
			end
		end
		ones
	end

	def blur_image
		ones = find_ones
		total_rows = @Images.length - 1
		@Images.each_with_index do |row,row_num|
			total_cols = row.length - 1
			row.each_with_index do |item,col_num|
				ones.each do |found_row,found_col|
					if row_num == found_row && col_num == found_col
						if row_num-1 >= 0
							@Images[row_num-1][col_num] = 1
						end
						if row_num < total_rows
							@Images[row_num+1][col_num] = 1
						end
						if col_num >= 1
							@Images[row_num][col_num-1] = 1
						end
						if col_num < total_cols
							@Images[row_num][col_num+1] = 1
						end
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
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
# image.output_image
image.blur_image
puts "One Pixel Transformation"
puts ''
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
# image.output_image
image.blur_image
puts ''
puts "Two Pixel Transformation"
puts ''
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0]
])
# image.output_image
image.blur_image
puts ''
puts "Pixel Edge Transformation"
puts ''
image.output_image