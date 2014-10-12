require "linkedlist/version"
require "node"

#Uma implementação simples e didatica de uma lista duplamente encadeada.
#
#Autor:: Thiago Gonzaga
#Licença:: MIT
class LinkedList

	#Inicializa uma nova lista podendo conter
	# * tamanho
	# * dado inicial
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

	#Alias para length
	#alias:: length()
	def size
		@length
	end

	#insere um item no final da lista
	#alias:: add()
	def push(info)
		add(info)
	end

	#remove um item do final da lista
	def pop
		remove(@length - 1)
	end

	#enfileira um item, ou seja, insere no final da fila
	def enq(info)
		add(info)
	end

	#desenfileira um item, ou seja, remove do inicio da fila
	def deq
		remove(0)
	end

	#insere um item no final da lista
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

	#recupera um item de um determinado indice, iniciando por 0
	def get(index)
		dir = index > @length/2? -1: 1
		go(dir: dir, index: index)
	end

	#remove um item contido num determinado indice
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

	#retorna primeiro item da lista
	def first
		@head.info
	end

	#retorna o ultimo item da lista
	def last
		@tail.info
	end

	def each
		curr = @head
		while curr != nil
			yield(curr.info) if block_given?
			curr = curr.next
		end
	end

	def reverse_each
		curr = @tail
		while curr != nil
			yield(curr.info) if block_given?
			curr = curr.previous
		end
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

	#verifica se a lista está vazia
	def empty?
		@length == 0
	end

	#remove todos os itens da lista
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

	#percorre a lista
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
