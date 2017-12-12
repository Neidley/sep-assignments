class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @items[index(key,size)] = value
  end

  def [](key)
    @items[index(key,size)]
  end

  def resize
    @items = Array.new(size*2)
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
