require_relative 'pixel'

class Screen < Pixel
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    pixel.x = x
    pixel.y = y
    @matrix << pixel
  end


  def at(x, y)
    (@matrix.select { |pixel| pixel.x == x && pixel.y == y })[0]
  end

  private

  def inbounds(x, y)
  end

end
