class Node

	attr_accessor :info, :next, :previous

	def initialize(info, previous: nil, _next: nil)
		@info = info
		@next = _next
		@previous = previous
	end

	def to_s
		s = (info == nil)? "nil": "#{@info}"
		s << ", " if @next != nil
		s
	end

end
