class LinkedList
  
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
    if node.next == nil
      p node.value
    else
      p node.value
      print(node.next)
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

  def reverse
    node = @head
    reverse_list = LinkedList.new
    while node != nil
      reverse_list.unshift(node.value)
      node = node.next
    end
    reverse_list
  end

end

