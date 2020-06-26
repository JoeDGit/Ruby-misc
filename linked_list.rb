class LinkedList
  attr_accessor :size, :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  def size
    @size
  end

  def head
    @head.value
  end

  def tail
    temp = @head
    idx = 0
    while idx < @size
      temp = temp.next_node
      idx += 1
    end
    temp.value
  end

  
  def at(index)
    temp = @head
    cur_idx = 0
    while cur_idx != index
      temp = temp.next_node
      cur_idx += 1
    end
    temp
  end

  def pop
    if @head.nil?
      puts "Linked list is empty"
    end
    if @head == @tail
      @tail = nil
      @head = nil
    else
      current_node = @head
      while current_node.next_node != @tail
        current_node = current_node.next_node
      end
      current_node = nil
    end
    @size -= 1
    @tail = current_node
  end

  def contains?(value)
    temp = @head
    contains = false
    while temp != tail
      contains = true if temp.value == value
      temp = temp.next_node
      break if contains == true
    end
    contains
  end

  def find(value)
    index = 0
    temp = @head
    while temp != tail
      return index if temp.value = value

      temp = temp.next_node
      index +=1
    end
    nil
  end

  def to_s
    temp = @head
    until temp.nil? do
      puts "( #{temp.value} ) -> "
      temp = temp.next_node
    end
  end
end


class Node
  attr_accessor :value, :next_node
  def initialize(val = nil)
    @value = val
    @next_node = nil
  end

end
  

list = LinkedList.new
10.times do
  list.append(rand(10).to_i)
end

puts list.to_s
puts list.pop
puts list.find(5)
puts list.contains?(5)
puts list.to_s
puts list.size
puts list.head
puts list.tail
