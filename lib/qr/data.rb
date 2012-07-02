require 'qr/layer'

module QR
  class Data < Layer
    def initialize(n, o)
      super n, o
      @index = -1
    end
    def module?(x, y, config)
      @index += 1 
      config[:data][@index] == '1'
    end
  end
end
