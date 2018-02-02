require_relative 'node'

class BinarySearchTree

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

    #given root and data, uses find_parent method to find parent
    parent = find_parent(root, data)

    #given root and data, finds node to be nuke(d)
    nuke = find(root, data)

    #if node to be deleted has no children, do this
    if !nuke.left && !nuke.right
      if parent.left.title == data
        parent.left = nil
      elsif parent.right.title == data
        parent.right = nil
      end

    #if node to be deleted has only left child, do this
    elsif nuke.left && !nuke.right
      if parent.left.title == data
        parent.left = nuke.left
      elsif parent.right.title == data
        parent.right = nuke.left
      end

    #if node to be deleted has only right child, do this
    elsif !nuke.left && nuke.right
      if parent.left.title == data
        parent.left = nuke.right
      elsif parent.right.title == data
        parent.right = nuke.right
      end

    #if node has left AND right children, do this
    elsif nuke.left && nuke.right
      #

    #catches any outliers and just returns nil (should never reach this)
    else
      return nil
    end
  end

  # takes a root and data to return the parent node for use in delete method
  def find_parent(root, data)

    # returns nil if input root or data are nil
    return nil if root.nil? || data.nil?

    # p "data: #{data}"
    # p "root.left.title: #{root.left.title || nil}"
    # p "root.right.title: #{root.right.title || nil}"

    # if the current root's left or right child has a title matching data, return root
    if root.left.title == data || root.right.title == data
      return root

    # recursively update root to right child if no left exists
    elsif !root.left && root.right
      self.find_parent(root.right, data)

    # recursively update root to left child if no right exists
    elsif !root.right && root.left
      self.find_parent(root.left, data)

    # recursively update root to left if both children exist
    elsif root.right && root.left
      self.find_parent(root.left, data)

    # handles outliers (should never reach this)
    else
      return nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

end
