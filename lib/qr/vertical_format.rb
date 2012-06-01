module QR
  class VerticalFormat < Layer
    def initialize(n, o)
      super n, o
    end
    
    def module?(x, y)
      return super(x, y) if x != 8
      return true if max - y == 7
      if y < 8
        format[y] == '1'
      elsif max - y < 7
        format[14 - (max - y)] == '1'
      else
        super x, y 
      end
    end
  end
end
