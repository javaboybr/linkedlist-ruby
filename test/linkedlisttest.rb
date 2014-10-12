require 'test/unit'

class LinkedListTest < Test::Unit::TestCase
	def test_instance
		l = LinkedList.new(1,"test")
		assert_equal 1, l.length
	end
end