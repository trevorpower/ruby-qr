module QR
  class Layer

    def initialize(n)
      @next = n
    end 

    def module? *args
      @next.module? *args
    end

  end
end
