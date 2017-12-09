class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    temp = @stack.last
    @stack.delete_at(@stack.length-1)
    self.top = @stack.last
    return temp
  end

  def empty?
    if @stack.length == 0
      true
    else
      false
    end
  end

end
