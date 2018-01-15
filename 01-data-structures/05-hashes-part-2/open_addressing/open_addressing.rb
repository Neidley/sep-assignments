require_relative 'node'

class OpenAddressing

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    found_index = index(key,size)
    while @items[found_index]
      found_index += 1
      if found_index == (@items.length - 1)
        self.resize
        self[key] = value
      end
    end
    @items[found_index] = Node.new(key, value)
  end

  def [](key)
    found_index = index(key,size)
    if @items[found_index].key == key
      return @items[found_index].value
    else
      while @items[found_index]
        found_index += 1
        if @items[found_index].key == key
          return @items[found_index].value
        end
      end
    end
    return nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if @items[index].nil?
      return index
    else
      available_index = 0
      while @items[available_index]
        available_index += 1
        if available_index == @items.count
          return -1
        end
      end
      return available_index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
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

  def print_out
    counter = 0.0
    @items.each_with_index do |item, index|
      if !item
        p "nothing is at index #{index}."
      else
        counter += 1
        p "item ( #{item.key} : #{item.value} ) is at index #{index}."
      end
    end
    p "load factor is #{counter} / #{self.size} = #{counter / self.size}"
  end

end
