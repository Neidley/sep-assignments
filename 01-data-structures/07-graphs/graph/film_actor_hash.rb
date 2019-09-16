class HashItem
  attr_accessor :key
  attr_accessor :value_array

  # key is movie, value will be an array with actor/nodes in it
  def initialize(key)
    @key = key
    @value_array = []
  end

  def add_actor(actor)
    self.value_array.push(actor)
  end

end
