require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def find_index(number)
    current = @head
    count = 1
    until count == number
      current = current.next
      count += 1
    end
    current
  end

  def delete_index(number)
    current = @head
    count = 1
    until count == number
      current = current.next
      count += 1
    end
    self.delete(current)
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    return nil if @head == nil

    node = @head
    popped = @tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      until node.next == @tail
        node = node.next
      end
      @tail = node
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    return nil if @head.nil?
    print_string = ""
    current = @head
    print_string.concat(current.data + "\n")
    until current.next.nil?
      current = current.next
      print_string.concat(current.data + "\n")
    end
    puts print_string
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    removed = nil
    if node == @head
      removed = @head
      node = @head.next
      @head = node
    elsif node == @tail
      removed = @tail
      current = @head
      until current.next == @tail
        current = current.next
      end
      @tail = current
      @tail.next = nil
    else
      current = @head
      until current.next == node
        current = current.next
      end
        link_1 = current
      until current == node
        current = current.next
      end
        link_2 = current.next
        removed = current
        link_1.next = link_2
    end
    removed
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head.nil?
      @tail = node
    else
      node.next = @head
    end
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      return nil
    end
    front = @head
    @head = front.next
    front
  end
end
