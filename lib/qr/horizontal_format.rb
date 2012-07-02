module QR
  class HorizontalFormat < Layer
    
    def initialize lower_layer, config
      super lower_layer
    end

    def module?(x, y, max, config)
      return super(x, y, max, config) if y != 8
      if x < 7
        config[:format][x] == '1'
      elsif x == 7
        config[:format][6] == '1'
      elsif max - x < 8
        config[:format][x - max + 14] == '1'
      else
        super x, y, max, config 
      end
    end

  end
end
