require "linkedlist/version"
require "node"

module Linkedlist

	class LinkedList

		def initialize(length=0, item=nil)
			@tail = nil
			@head = nil
			@length = length
			for i in (1..length)
				self << item
				yield(item) if block_given?
			end
		end

		def length
			@length
		end

		def push(info)
			add(info)
		end

		def pop
			remove(@length - 1)
		end

		def enq(info)
			add(info)
		end

		def deq
			remove(0)
		end

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

		def go(dir: 1, index: nil)
			i = 0
			curr = @head if dir == 1
			curr = @tail if dir == -1
			while curr != nil
				break if i == index
				curr = curr.next if dir == 1
				curr = curr.previous if dir == -1
				i += 1
			end
			curr
		end

		def get(index)
			dir = index > @length/2? -1: 1
			go(dir: dir, index: index)
		end

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
			curr.info
		end

		def first
			@head.info
		end

		def last
			@tail.info
		end

		def each
			curr = @head
			while curr != nil
				yield(curr.info)
				curr = curr.next
			end
		end

		def reverse_each
			curr = @tail
			while curr != nil
				yield(curr.info)
				curr = curr.previous
			end
		end

		def <<(info)
			add(info)
		end

		def to_s
			s = "["
			curr = @head
			while curr != nil
				s << curr.to_s
				curr = curr.next
			end
			s << "]"
		end

		def to_a
			arr = []
			each {|valor| arr << valor}
			arr
		end

		def [](index)
			i = get(index)
			i.info if i != nil
		end

		def []=(index, value)
			i = get(index)
			i.info = value if i != nil
		end

	end
end
