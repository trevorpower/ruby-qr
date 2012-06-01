module QR
  class Layer

    def initialize(n, o)
      @next = n
    end 

    def max
      @next.max
    end

    def format
      @next.format
    end

    def module?(x, y)
      @next.module? x, y
    end

  end
end
