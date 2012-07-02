module QR
  class Position < Layer

    def initialize lower_layer, config
      super lower_layer
    end

    def firstSquare?(x, y)
      @x, @y = x, y
      x < 8 && y < 8
    end
    def square?(x, y)
      firstSquare?(x, y) || firstSquare?(max - x, y) || firstSquare?(x, max - y)
    end
    def module?(x, y, config)
      return @next.module?(x, y, config) unless square?(x, y)
      return false if @x == 7 || @y == 7
      return true if @x == 0 || @x == 6
      return true if @y == 0 || @y == 6
      @x != 1 && @y != 1 && @x != 5 && @y != 5
    end
  end
end
