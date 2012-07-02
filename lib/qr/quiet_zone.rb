module QR
  class QuietZone < Layer
    def initialize (n, g)
      @gap = g
      super(n, g)
    end
    def max
      super + @gap * 2
    end
    def module?(x, y, config)
      return false if x < @gap || y < @gap
      return false if x > max - @gap || y > max - @gap
      @next.module?(x - @gap, y - @gap, config)
    end
  end
end

