module QR
  class HorizontalFormat < Layer
    def module?(x, y, config)
      return super(x, y, config) if y != 8
      if x < 7
        format[x] == '1'
      elsif x == 7
        format[6] == '1'
      elsif max - x < 8
        format[x - max + 14] == '1'
      else
        super x, y, config 
      end
    end
  end
end
