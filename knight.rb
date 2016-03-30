class Node
	attr_reader :parent , :x, :y
	attr_accessor :children
	def initialize(x, y, parent=nil)
		@x = x
		@y = y
		@children = nil
		@parent = parent
	end
end

class Knight
	def self.moves(begpos, endpos)

		#queue for breadth insertion
		queue = Array.new

		#initial x,y coordinates
		x, y = begpos.first, begpos.last
		square = Node.new(x, y)
		
		#comparing current square x,y coordinates with end x,y position
		while [square.x, square.y] != endpos
			#generating children for current x,y cooridinate and enqueing 
			square.children = select_children(square.x, square.y, square)
			square.children.each {|child| queue << child}
			square = queue.shift
		end
		
		 puts bubble_up square
		
	end 

	private

	def self.select_children(x, y, square)
		#creating array for all feasible and infeasible moves
		positions = [[x+2, y+1],[x+2, y-1], [x - 2, y + 1], [x - 2, y - 1], \
		[x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2]]
		#selecting feasible moves
		playable_moves = positions.select{|x, y| x.between?(0,7)\
		 and y.between?(0,7) }
		 #creating array of nodes with selected x,y coordinates
		 playable_moves.map{|x, y| Node.new(x, y, square)}
	end

	def self.bubble_up square
		#finding parents  path recursively
		bubble_up(square.parent) if !square.parent.nil?
		print "#{[square.x, square.y]} "	
	end

end


Knight.moves([0,0],[7,6])

