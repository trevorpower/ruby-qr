module QR
  class Size < Layer
    def initialize(n, c, o)
      @max = o - 1
      super n
    end
    def max
      @max
    end
  end
end
