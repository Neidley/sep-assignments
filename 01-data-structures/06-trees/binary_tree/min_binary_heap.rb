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
      elsif node.rating > temp.rating
        temp = temp.right
      else
        #
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.title == data
      return root
    elsif root.left == nil && root.right
      self.find(root.right, data)
    elsif root.right == nil && root.left
      self.find(root.left, data)
    end
  end

  def delete(root, data)
    return nil if root.nil?
    # if root.title == data
      #create dummy root, set dummy.left
    #find parent, set to variable
    #find node with data, set to variable
    #if node has no children
      #set parent.left or parent.right to nil
    #if node has one child
      #set parent.left or parent.right to node.left or right
    #if node has two children
      #find minimum in right subtree from node
      #set node's children to be minimum's children
      #remove minimum from subtree
  end

  # Recursive Breadth First Search
  def printf(root)
  end
end
