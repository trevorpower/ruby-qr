module QR
  class Size < Layer
    def initialize(n, c, o)
      @max = o - 1
      super n, c  
    end
    def max
      @max
    end
  end
end
