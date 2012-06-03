require 'qr/layer'

module QR
  class Data < Layer
    def initialize(n, o)
      super n, o
      @index = -1
    end
    def module?(x, y)
      return super(x, y) unless @index < data.size
      @index += 1 
      data[@index] == '1'
    end
  end
end
