class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @hash = HashItem.new(key,value)
    @items.each do |item|
      if item == @hash
        return item
      elsif item == nil
        @items[index(key,size)] = @hash
      else
        resize
      end
    end
    p @items
    p @items[index(key,size)].value
    p @items.size
  end

  def [](key)
    @items[index(key,size)].value
  end

  def resize
    old = @items
    @items = Array.new(size * 2)
    old.each do |item|
      if !item
        next
      else
        @items[index(item.key,size)] = item
      end
    end
    @items
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end
end
