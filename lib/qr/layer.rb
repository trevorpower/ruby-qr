module QR
  class Layer

    def initialize(n, c)
      @next = n
    end 

    def max
      @next.max
    end

    def module?(x, y, config)
      @next.module? x, y, config
    end

  end
end
