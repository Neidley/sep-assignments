require_relative 'film_actor_hash'

class Node
# Name should be the actor and
# the film_actor_hash should be a hash with keys as the film name
# with an array for the value.
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :left
  attr_accessor :right

  # name is the actor's name

  # film_actor_hash is an array of movies/nodes

  def initialize(name)
    @name = name
    @film_actor_hash = []
    @left = nil
    @right = nil
  end

  def add_movie(movie, fellow_actor)
    new_movie = HashItem.new(movie)
    new_movie.add_actor(fellow_actor)
    self.film_actor_hash.push(new_movie)
    if self.left == nil
      self.left = fellow_actor
    else
      self.right = fellow_actor
    end
  end

  # prints out a string to tell you what movies an actor is in and with what actor.
  def print_info
    output = ""
    self.film_actor_hash.each do |movie|
      movie.value_array.each do |actor|
        output << "#{self.name} is in #{movie.key} with #{actor.name}.\n"
      end
    end
    print output
  end

end
