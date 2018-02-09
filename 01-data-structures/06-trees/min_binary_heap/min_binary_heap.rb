require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp = root
    while temp
=begin
      if node.rating < temp.rating
        parent = find_parent(root, temp)
        if parent.left == temp
          parent.left = node
          node.left = temp
          return node
        elsif parent.right == temp
          parent.right = node
          node.left = temp
          return node
        else
          return nil
        end
=end
      if node.rating > temp.rating && !temp.left
        temp.left = node
        return node
      elsif node.rating > temp.rating && !temp.right
        temp.right = node
        return node
      else
        seeking_children = find_space(root)
        if !seeking_children.left
          seeking_children.left = node
          return node
        elsif !seeking_children.right
          seeking_children.right = node
          return node
        end
      end
    end
    return nil
  end

  def find_space(root)
    array = [root]
    while !array.empty?
      node = array.shift
      if node.left && node.right
        array.push(node.left)
        array.push(node.right)
      else
        return node
      end
    end
  end

  # Breadth First Search
  def find(root, data)
    return nil if data.nil?
    array = [root]
    while !array.empty?
      node = array.shift
      if node == nil
        next
      elsif node.title == data
        return node
      else
        array.push(node.left)
        array.push(node.right)
      end
    end
    return nil
  end

  # finds a parent and node to be deleted then handles deletion according to number of children
  def delete(root, data)

    # returns nil if root or data input into delete method are nil
    return nil if root.nil? || data.nil?

    #given root and data, finds node to be deleted
    node = find(root, data)

    #given root and data, uses find_parent method to find parent
    parent = find_parent(root, node)

    #if node to be deleted has no children, do this
    if !node.left && !node.right
      if parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end

    #if node to be deleted has only left child, do this
    elsif node.left && !node.right
      if parent.left == node
        parent.left = node.left
        node = nil
      elsif parent.right == node
        parent.right = node.left
        node = nil
      end

    #if node to be deleted has only right child, do this
    elsif !node.left && node.right
      if parent.left == node
        parent.left = node.right
        node = nil
      elsif parent.right == node
        parent.right = node.right
        node = nil
      end

    #if node to be deleted has left AND right children, do this
    elsif node.left && node.right

      #find minimum in subtree
      replacement_node = node.left
      replacement_node.right = node.right || nil
      replacement_node.left = node.left.left || nil

      if parent.left == node
        parent.left = replacement_node
        node = nil
      elsif parent.right == node
        parent.right = replacement_node
        node = nil
      end

    #catches any outliers and just returns nil (should never reach this)
    else
      return nil
    end
  end

=begin
  # write a function to find minimum
  def find_min(node)
    if !node.left
      return node
    else
      find_min(node.left)
    end
  end
=end

  def find_parent(root, node)

    return nil if node.nil?
    array = [root]
    while !array.empty?
      current = array.shift
      if current == nil
        next
      elsif current.left == node || current.right == node
        return current
      else
        array.push(current.left)
        array.push(current.right)
      end
    end
    return nil
  end

  # Breadth First Search
  def printf(children=nil)
    print_order = [@root]

    while !print_order.empty?
      node = print_order.shift

      if node.title != nil
        puts "#{node.title}: #{node.rating}"
      end

      if node.left
        print_order.push(node.left)
      end

      if node.right
        print_order.push(node.right)
      end
    end
  end

end
