def find_missing_number(sequence)
	number_sequence = sequence.split.map(&:to_i).sort

	number_sequence.each.with_index(1) do |actual, expected|
		return expected unless actual == expected
		end
	0
end

puts find_missing_number("1 2 4 a")