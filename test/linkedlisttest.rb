require 'test/unit'
require 'logger'
require_relative '../lib/linkedlist'

class LinkedListTest < Test::Unit::TestCase
	
	def setup
		@log = Logger.new(STDOUT)
	end

	def test_instance
		list = LinkedList.new(1,"test")
		assert_equal 1, list.length
		assert_not_nil list << 1 << 2 << "string" << false << true << nil
		for i in list
			@log.info "Object type: #{i.class}"
		end
		@log.info "List length: #{list.length}"
		assert_nil list[list.length-1]
	end

	def test_empty
		list = LinkedList.new
		assert list.empty?
	end

	def test_not_found_index
		list = LinkedList.new
		assert_nil list[1000]
	end

	def test_remove
		list = LinkedList.new << 1 << 2 << "string" << false << true << nil
		assert_equal list.length, 6
		@log.info "List length: #{list.length} content: #{list}"
		assert_nil list.pop
		@log.info "Removed last from List #{list}"
		assert list.remove(list.length-1)
		@log.info "Removed last from List #{list}"
		assert_equal list.deq, 1
		@log.info "Removed first from List #{list}"
		assert_equal list.remove(1), "string"
		@log.info "Removed \"string\" List #{list}"
	end

	def test_insert_at
		list = LinkedList.new << 1 << 2 << "string" << false << true << nil
		assert_not_nil list.insert_at(0, -1)
		@log.info "List #{list}"
		assert_equal list[0], -1
		assert_equal list[1], 1
		assert_not_nil list.insert_at(3, -1)
		assert_equal list[3], -1
		assert_equal list[4], "string"
		assert_not_nil list.insert_at(8, -1)
		assert_nil list[7]
		assert_equal list[8], -1
		assert_not_nil list.insert_at(15, -1)
		assert_equal list.length, 16
		@log.info "List #{list}"
	end

	def test_nil
		list = LinkedList.new
		assert_nil list.first
		assert_nil list.last
	end
end