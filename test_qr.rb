require 'printer'

class Empty
  def module?(x, y)
    false
  end
  def max
    20
  end
end

class Mask
  def initialize (n)
    @next = n
  end
  def max
    @next.max
  end
  def module?(x, y)
    return !@next.module?(x, y) if y % 2 == 0
    @next.module?(x, y)
  end
end

class Mode
  def initialize (n)
    @next = n
  end
  def max
    @next.max
  end
  def module?(x, y)
    return true if x == max - 1 && y == max
    @next.module?(x, y)
  end
end

class Timing
  def initialize (n)
    @next = n
  end
  def max
    @next.max
  end
  def module?(x, y)
    return y % 2 == 0 if x == 6
    return x % 2 == 0 if y == 6
    @next.module?(x, y)
  end
end

class Position
  def initialize (n)
    @next = n
  end
  def max
    @next.max
  end
  def firstSquare?(x, y)
    @x, @y = x, y
    x < 8 && y < 8
  end
  def square?(x, y)
    firstSquare?(x, y) || firstSquare?(max - x, y) || firstSquare?(x, max - y)
  end
  def module?(x, y)
    return @next.module?(x, y) unless square?(x, y)
    return false if @x == 7 || @y == 7
    return true if @x == 0 || @x == 6
    return true if @y == 0 || @y == 6
    @x != 1 && @y != 1 && @x != 5 && @y != 5
  end
end

class QuietZone
  def initialize (g, n)
    @next = n
    @gap = g
  end
  def max
    @next.max + @gap * 2
  end
  def module?(x, y)
    return false if x < @gap || y < @gap
    return false if x > max - @gap || y > max - @gap
    x != 0 && y != 0 && x != max && y != max && @next.module?(x - @gap, y - @gap)
  end
end

stack = QuietZone.new(2, Position.new(Timing.new(Mask.new(Mode.new(Empty.new)))))

qr = Hash.new

(0..stack.max + 1).each do |y|
  (0..stack.max).each do |x|
    qr[[x,y]] = stack.module?(x, y)
  end
end

Printer.printBits qr, stack.max
