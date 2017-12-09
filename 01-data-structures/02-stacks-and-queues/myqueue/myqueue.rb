class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @tail = element
    @head = @queue.first
  end

  def dequeue
    temp = @queue.first
    @queue.delete_at(0)
    @tail = @queue.last
    @head = @queue.first
    return temp
  end

  def empty?
    if @queue.length == 0
      true
    else
      false
    end
  end
end
