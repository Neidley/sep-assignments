class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @hash = HashItem.new(key,value)
    original_index = index(key,size)
    hash_item = @items[original_index]
    if hash_item == @hash
      return
    elsif hash_item && hash_item.key != @hash.key
      resize
      #recursive call here
      self[key] = value
    else
      if hash_item && hash_item.value != @hash.value
        resize
      end
      @items[original_index] = @hash
    end
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
