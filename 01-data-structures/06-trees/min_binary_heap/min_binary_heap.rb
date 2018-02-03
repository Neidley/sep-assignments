require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    temp = root
    while temp
      if node.rating < temp.rating && temp.left == nil
        temp.left = node
        return node
      elsif node.rating > temp.rating && temp.right == nil
        temp.right = node
        return node
      elsif node.rating < temp.rating
        temp = temp.left
      else
        temp = temp.right
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?
    if root.title == data
      return root
    elsif !root.left && root.right
      self.find(root.right, data)
    elsif !root.right && root.left
      self.find(root.left, data)
    elsif root.right && root.left
      self.find(root.left, data)
    else
      return nil
    end
  end

  # finds a parent and node to be deleted then handles deletion according to number of children
  def delete(root, data)

    # returns nil if root or data input into delete method are nil
    return nil if data.nil? || root.nil?

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
      elsif parent.right == node
        parent.right = node.left
      end

    #if node to be deleted has only right child, do this
    elsif !node.left && node.right
      if parent.left == node
        parent.left = node.right
      elsif parent.right == node
        parent.right = node.right
      end

    #if node to be deleted has left AND right children, do this
    elsif node.left && node.right
      #no clue
      p "you are trying to delete a node with two children"

    #catches any outliers and just returns nil (should never reach this)
    else
      return nil
    end
  end

  # Recursive Depth First Search
  def find_parent(root, node)
    return nil if node.nil? || root.nil? || (root.right.nil? && root.left.nil?)

    if root.right == node || root.left == node
      return root
    elsif !root.left && root.right
      self.find_parent(root.right, node)
    elsif !root.right && root.left
      self.find_parent(root.left, node)
    elsif root.right && root.left
      self.find_parent(root.left, node)
    else
      return nil
    end
  end

  # Recursive Breadth First Search
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
