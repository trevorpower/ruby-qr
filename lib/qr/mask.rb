module QR
  class Mask < Layer
    def initialize n, o
      super n, o
      @code = 0b001 
    end
    def format? i
      return super i if i < 12
      @code[i - 12]
    end
    def module?(x, y)
      return super(x, y) unless y % 2 == 0
      !super x, y
    end
  end
end
