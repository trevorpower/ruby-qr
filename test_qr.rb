require 'qr/code'

module QR
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

end

qr = QR::Code.new

Printer.printBits qr.bits, qr.max + 1
