class LinkedList
	attr_reader :size, :head, :tail

	class Node
		attr_accessor :value, :prev_node, :next_node

		def initialize(value = nil, prev_node = nil, next_node = nil)
			@value = value
			@prev_node = prev_node
			@next_node = next_node
		end
	end

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(value)
		if @size == 0
			set_first_node(value)
		else
			@tail.next_node = Node.new(value, @tail)
			@tail = @tail.next_node
		end
		@size += 1
	end

	def prepend(value)
		if @size == 0
			set_first_node(value)
		else
			@head = Node.new(value, nil, @head)
		end
		@size += 1
	end

	def at(index)
		i = 0
		node = @head

		until i == index
			i += 1
			node = node.next_node
		end
		node
	end

	def pop
		last = @tail
		@tail = @tail.prev_node
		@tail.next_node = nil
		@size -= 1

		last
	end

	def contains?(value)
		node = @head

		until node == nil || node.value == value
			node = node.next_node
		end

		!node.nil?
	end

	def find(value)
		node = @head
		index = 0

		until node == nil || node.value == value 
			node = node.next_node
			index += 1
		end

		return nil if node.nil?
		index
	end

	def to_s
		string = ""
		node = @head

		until node == nil
			string << "( #{node.value} ) -> "
			node = node.next_node
		end

		string << "nil"
	end

	#Extra credit
	def insert_at(index, value)
		at(index).value = value
	end

	def remove_at(index)
		node = at(index)

		if node == @head && node == @tail
			@head = nil
			@tail = nil
		elsif node == @head
			@head = node.next_node
			@head.prev_node = nil
		elsif node == @tail
			@tail = node.prev_node
			@tail.next_node = nil
		else
			node.prev_node.next_node = node.next_node
			node.next_node.prev_node = node.prev_node
		end
		@size -= 1				
	end

	private
	def set_first_node(value)
		@head = Node.new(value)
		@tail = @head
	end
end

list = LinkedList.new
while true
	puts list.to_s

	input = gets.chomp
	case input
	when '1' then list.append(gets.chomp)
	when '2' then list.prepend(gets.chomp)
	when '3' then puts list.size
	when '4' then puts list.head.value
	when '5' then puts list.tail.value
	when '6' then puts list.at(gets.chomp.to_i).value
	when '7' then puts list.pop.value
	when '8' then puts list.contains?(gets.chomp)
	when '9' then puts list.find(gets.chomp)
	when '10' then list.to_s
	when '11' then list.insert_at(gets.chomp.to_i, gets.chomp)
	when '12' then list.remove_at(gets.chomp.to_i)
	end

end