module QR
  class Size < Layer
    def initialize(n, o)
      @max = o - 1
      super n, o  
    end
    def max
      @max
    end
  end
end
