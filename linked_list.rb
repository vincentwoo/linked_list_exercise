class LinkedList

  include Enumerable
  
  class Node
    attr_accessor :value, :next

    def initialize(value = nil)
      @value = value
    end
    def to_s
      @value
    end
  end
  
  attr_accessor :head
  
  def initialize(head = nil)
    @head = head
  end

  def to_s
    @head
  end

  def print(node = @head)
    if node.nil?
      nil
    elsif node.next == nil
      p node.value
    else
      p node.value
      print(node.next)
    end
  end

  def rev_print(node = @head)
    if node.nil?
      nil
    elsif node.next == nil
      p node.value
    else
      rev_print(node.next)
      p node.value
    end
  end

  def length(node = @head)
    if node == nil
      0
    else
      1 + length(node.next)    
    end 
  end
  
  def at(node = @head, index)
    if node == nil 
      nil
    elsif node && index == 0
      node.value
    else
      at(node.next, index-1)
    end
  end

  def add_item_to_end(node = @head, new_item_value)
    if node.next == nil
      node.next = Node.new(new_item_value)
    else
      add_item_to_end(node.next, new_item_value)
    end
  end

  def push(value)
    if @head == nil
      @head = Node.new(value)
    else
      add_item_to_end(@head, value)
    end
  end

  def pop(node = @head)
    if node == nil
      nil
    elsif length(node) == 1
      popped = node.value
      @head = nil
      popped
    else
      recursive_pop(node)
    end
  end

  def recursive_pop(node = @head)
    if node.next.next == nil
      popped = node.next.value
      node.next = nil
      popped
    else
      recursive_pop(node.next)
    end
  end

  def to_a
    node = @head
    array = []
    while node != nil
      array << node.value
      node = node.next
    end
    array
  end

  def recursive_eql(first_node, second_node)
    if first_node == nil && second_node == nil
      true
    elsif first_node == nil && second_node != nil || first_node != nil && second_node == nil
      false
    elsif first_node.value != second_node.value
      false
    else
      recursive_eql(first_node.next, second_node.next)
    end
  end

  def eql?(node = @head, list2)
    recursive_eql(node, list2.head)
  end

  def dup
    node = @head
    dup_list = LinkedList.new
    while node != nil
      dup_list.push(node.value)
      node = node.next
    end
    dup_list
  end

  def shift(node = @head)
    if length(node) == 0
      nil
    elsif length(node) >= 1
      shifted = node.value
      @head = node.next
      shifted
    end
  end

  def unshift(new_item_value)
    new_node = Node.new(new_item_value)
    new_node.next = @head
    @head = new_node
  end

  def reverse
    node = @head
    reverse_list = LinkedList.new
    while node != nil
      reverse_list.unshift(node.value)
      node = node.next
    end
    reverse_list
  end

  def reverse!
    current_node = @head
    prev_node = nil

    while current_node != nil
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    @head = prev_node
    self
  end

  def each(&block)
    node = @head
    while node
      block.call(node.value)
      node = node.next
    end
  end

  def print2 
    each { |n| p n }
  end

  def inject(*args, &block)
    #no default value and list is 0
    if args.length == 0 && self.length == 0
      return nil
    #no default value and list is 1
    elsif args.length == 0 && self.length == 1
      return @head.value
    #no default value and list is suitable length
    elsif args.length == 0
      accumulator = @head.value
      node = @head
      while node.next
        current = node.next.value
        accumulator = block.call(accumulator, current)
        node = node.next
      end
    #default value and list is 0
    elsif args.length == 1 && self.length == 0
      return args.first
    #default value and list is 1 or more
    elsif args.length == 1 && self.length >= 1
      accumulator = args.first
      self.each do |node|
        accumulator = block.call(accumulator, node)
      end
    end
    accumulator
  end

end

