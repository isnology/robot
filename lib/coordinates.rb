class Coordinates

  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def +(other)
    Coordinates.new(@x + other.x, @y + other.y)
  end

  def ==(other)
    self.class == other.class && @x == other.x && @y == other.y
  end

  # Note that class "Set" is based on a Hash collection
  # in order to use a user defined class as hash key it needs the following 2 methods (#eql?, #hash)

  alias eql? ==

  def hash
    @x.hash ^ @y.hash # XOR
  end

end