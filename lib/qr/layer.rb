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

    def format
      @next.format
    end

    def data
      @next.data
    end

    def module?(x, y)
      @next.module? x, y
    end

  end
end
