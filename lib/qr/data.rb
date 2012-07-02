require 'qr/layer'

module QR
  class Data < Layer
    def initialize(n, c)
      super n, c
      @index = -1
    end

    def module?(x, y, config)
      @index += 1 
      config[:data][@index] == '1'
    end
  end
end
