require_relative 'node_actor'

class Graph

  def initialize(root)
    @root = root
  end

  #Breadth First Search finds node given root(node) and data(string)
  def find(root, data)
    current = root
    array = []
    array.push(current)
    while !array.empty?
      current = array.shift
      if !current
        next
      elsif current.name == data
        return current
      else
        array.push(current.left)
        array.push(current.right)
      end
    end
    return nil
  end

  #Write a function that begins at a provided Node object
  #and returns an Array of at most six film titles
  #that connect it to the Kevin_Bacon Node.
  def find_kevin_bacon(node)
    bacon = self.find(node, "Kevin Bacon")
    current = node
    array = []
    result = []
    array.push(current)
    while !array.empty?
      current = array.shift
      if !current
        next
      elsif current.left.name == bacon.name
        result << "#{current.name} in #{current.film_actor_hash[0].key} with #{current.film_actor_hash[0].value_array[0].name}"
        if result.uniq.length > 6
          return "This actor has a Bacon number higher than 6!"
        else
          return result.uniq
        end
      else
        result << "#{current.name} in #{current.film_actor_hash[0].key} with #{current.film_actor_hash[0].value_array[0].name}"
        array.push(current.left)
        array.push(current.right)
      end
    end
    return nil
  end

end
