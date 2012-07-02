module QR
  class Layer

    def initialize(n, o)
      @next = n
    end 

    def configure(config)
    end

    def max
      @next.max
    end

    def module?(x, y, config)
      @next.module? x, y, config
    end

  end
end
