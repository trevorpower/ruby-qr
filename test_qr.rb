require 'printer'

class Layer
  def initialize(n, o)
    @next = n
  end 
  def max
    @next.max
  end
  def module?(x, y)
    @next.module? x, y
  end
end

class Empty < Layer
  def module?(x, y)
    false
  end
  def max
    20
  end
end

class Mask < Layer
  def module?(x, y)
    return !@next.module?(x, y) if y % 2 == 0
    super x, y
  end
end

class Mode < Layer
  def module?(x, y)
    return true if x == max - 1 && y == max
    super x, y
  end
end

class Timing < Layer
  def module?(x, y)
    return y % 2 == 0 if x == 6
    return x % 2 == 0 if y == 6
    @next.module?(x, y)
  end
end

class Position < Layer
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

class QuietZone < Layer
  def initialize (n, g)
    @gap = g
    super(n, g)
  end
  def max
    super + @gap * 2
  end
  def module?(x, y)
    return false if x < @gap || y < @gap
    return false if x > max - @gap || y > max - @gap
    #x != 0 && y != 0 && x != max && y != max && 
    @next.module?(x - @gap, y - @gap)
  end
end

class Invert < Layer
  def module?(x, y)
    !super x, y
  end
end

class QR
  def initialize
    stack do
      layer :Empty
      layer :Mode
      layer :Mask
      layer :Timing
      layer :Position
      layer :QuietZone, 4
      layer :Invert
    end
  end

  def stack(&modules)
    instance_eval &modules
  end

  def layer(name, options = nil)
    @stack = Kernel.const_get(name).new @stack, options
  end

  def bits
    n = @stack.max + 1
    arr = []
    (0...n**2).each do |i|
        arr[i] = @stack.module?(i % n, i / n)
    end
    arr 
  end

  def max
    @stack.max
  end
end

qr = QR.new

Printer.printBits qr.bits, qr.max + 1
