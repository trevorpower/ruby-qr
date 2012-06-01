module QR
  class HorizontalFormat < Layer
    def initialize(n, o)
      super n, o
    end
    
    def module?(x, y)
      return super(x, y) if y != 8
      if x < 7
        format[x] == '1'
      elsif x == 7
        format[6] == '1'
      elsif max - x < 6
        format[x - max + 16] == '1'
      else
        super x, y 
      end
    end
  end
end
