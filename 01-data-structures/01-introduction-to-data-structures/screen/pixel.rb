# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.

class Pixel
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y


  def initialize(red, green, blue, x, y)
    @red = bound_color(red) || red
    @green = bound_color(green) || green
    @blue = bound_color(blue) || blue
    @x = Integer(x)
    @y = Integer(y)
  end

  def select
    @pixel
  end

  private

  def validate_color(color)
  end

  def bound_color(primary_color)
    if !primary_color.is_a? Integer
      return "Quit playing games with my heart. Only numbers 0-255."
    else
      if primary_color <= 0
        primary_color = 0
      elsif primary_color >= 255
        primary_color = 255
      end
    end
  end

end
