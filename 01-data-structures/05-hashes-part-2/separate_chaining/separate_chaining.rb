require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    if load_factor > @max_load_factor
      self.resize
      self[key] = value
    end

    found_index = index(key,size)
    old_head = @items[found_index]
    @items[found_index] = Node.new(key, value)
    if old_head
      new_head = @items[found_index]
      new_head.next = old_head
    end
  end

  def [](key)
    found_index = index(key,size)
    head = @items[found_index]
    if head
      while head.next != nil
        if head.key == key
          return head.value
        end
        head = head.next
      end
      if head.key == key
        return head.value
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

  # Calculate the current load factor
  def load_factor
    counter = 0.0
    @items.each do |item|
      if item
        counter += 1
        while item.next
          counter += 1
          item = item.next
        end
      else
        next
      end
    end
    if (counter / size) > @max_load_factor
      self.resize
    end
    return (counter / size)
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
        while item.next
          item = item.next
          self[item.key] = item.value
        end
      end
    end
    @items
  end

  def print_out
    @items.each_with_index do |item, index|
      if !item
        p "nothing is at index #{index}."
      elsif item.next != nil
        p "item ( #{item.key} : #{item.value} ) is at index #{index}."
        head = item.next
        until head == nil
          p "item ( #{head.key} : #{head.value} ) is chained to index #{index}."
          head = head.next
        end
      else
        p "item ( #{item.key} : #{item.value} ) is at index #{index}."
      end
    end
    counter = 0
    @items.each do |item|
      if item
        counter += 1
        while item.next
          counter += 1
          item = item.next
        end
      else
        next
      end
    end
    p "load factor is #{counter.to_f} / #{self.size.to_f} = #{counter.to_f / self.size.to_f}"
  end

end
