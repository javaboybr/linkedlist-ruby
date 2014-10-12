# LinkedList

Simple implementation of doubly linked list data type in ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linkedlist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linkedlist

## Usage

```ruby
list = LinkedList.new
#adding some data, it could be whatever you want
list << "a string" << 1 << nil << false << Time.new
#it can be a stack, adding at the top
list.push "top of the stack"
#removing from the top
list.pop
#it can be a queue, adding at the end
list.enq "Last in"
#removing the first
list.deq
```

## Contributing

1. Fork it ( https://github.com/javaboybr/linkedlist-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
