require "linkedlist/version"
require "node"

#A simple implementation of doubly linked list data type
#
#Autor:: Thiago Gonzaga
#License:: MIT
class LinkedList

	#Creates a new instance of a list
	# * length
	# * initial data
	def initialize(length=0, item=nil)
		@tail = nil
		@head = nil
		@length = 0
		for i in (1..length)
			self << item
			yield(item) if block_given?
		end
	end

	#retorna o tamanho da lista
	def length
		@length
	end

	#Alias for length
	#alias:: length()
	def size
		@length
	end

	#Insert data on end
	#alias:: add()
	def push(info)
		add(info)
	end

	#remove the last item
	def pop
		remove(@length - 1)
	end

	#enqueue an item on end
	def enq(info)
		add(info)
	end

	#dequeue the first item
	def deq
		remove(0)
	end

	#insert an item on end
	def add(info)
		_new = Node.new(info, previous: @tail)
		if @head == nil
			@head = _new
			@tail = @head
		else
			@tail.next = _new
			@tail = _new
		end
		@length += 1
		self
	end

	#get data from it index starting at 0
	def get(index)
		dir = index > @length/2? -1: 1
		go(dir: dir, index: index)
	end

	#remove date by it index
	def remove(index)
		dir = index > @length/2? -1: 1
		curr = go(dir: dir, index: index)
		if curr != nil
			curr.previous.next = curr.next if !curr.previous.nil?
			curr.next.previous = curr.previous if !curr.next.nil?
			@tail = curr.previous if curr == @tail
			@head = curr.next if curr == @head
			curr.previous, curr.next = nil, nil
			@length -= 1
		end
		curr.info if curr != nil
	end

	#the first item of the list
	def first
		@head.info
	end

	#the last item of the list
	def last
		@tail.info
	end

	#go forward
	def each
		curr = @head
		while curr != nil
			yield(curr.info) if block_given?
			curr = curr.next
		end
	end

	#go backwards
	def reverse_each
		curr = @tail
		while curr != nil
			yield(curr.info) if block_given?
			curr = curr.previous
		end
	end

	#Convert to a string
	def to_s
		s = "["
		curr = @head
		while curr != nil
			s << curr.to_s
			curr = curr.next
		end
		s << "]"
	end

	#Convert to an array
	def to_a
		arr = []
		each {|valor| arr << valor}
		arr
	end

	#verify if the list is empty
	def empty?
		@length == 0
	end

	#remove all itens
	def clear
		@length = 0
		@next = nil
		@previous = nil
		self
	end

	def [](index)
		i = get(index)
		i.info if i != nil
	end

	def []=(index, value)
		i = get(index)
		i.info = value if i != nil
	end

	def <<(info)
		add(info)
	end

	#go through the list back and fourth
	private
	def go(dir: 1, index: nil)
		curr, i = @head, 0 if dir == 1
		curr, i = @tail, (@length-1) if dir == -1
		while curr != nil
			break if i == index
			curr = curr.next if dir == 1
			curr = curr.previous if dir == -1
			i += 1 if dir == 1
			i -= 1 if dir == -1
		end
		curr
	end

end
