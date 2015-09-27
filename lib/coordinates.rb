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
    self.class == other.class && @x == other.x && @y == other.y ? true : false
  end

  def to_sym
    "#{@x},#{@y}".to_sym
  end

end