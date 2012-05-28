module QR
  class HorizontalFormat < Layer
    def initialize(n, o)
      super n, o
    end
    
    def module?(x, y)
      return super(x, y) if y != 8
      if x < 7
        format?(15 - x)
      elsif max - x < 8
        format?(x)
      else
        super x, y 
      end
    end
  end
end
