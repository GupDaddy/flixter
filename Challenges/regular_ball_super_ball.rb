class Ball
	attr_accessor :ball_type

	def initialize(ball_type = "regular")
		@ball_type = ball_type
	end
end

puts Ball.new("super").ball_type
puts Ball.new.ball_type
