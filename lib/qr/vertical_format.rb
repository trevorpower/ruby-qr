module QR
  class VerticalFormat < Layer
    def initialize(n, o)
      super n, o
    end
    
    def module?(x, y, config)
      return super(x, y, config) if x != 8
      return true if max - y == 7
      if y < 8
        format[14 - y] == '1'
      elsif max - y < 7
        format[max - y] == '1'
      else
        super x, y, config 
      end
    end
  end
end
