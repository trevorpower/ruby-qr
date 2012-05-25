module QR
  class Modes
    def self.numeric
      0b0001
    end
    def self.alphanumeric
      0b0010
    end
    def self.byte
      0b0100
    end
    def self.eom
      0b0000
    end
  end
  class Mode < Layer
    def initialize(n, o)
      @mode = QR::Modes.send o
      @index = -1
      super n, o
    end
    def module?(x, y)
      return super(x, y) unless @index < 3
      @index += 1 
      @mode[@index] == 1
    end
  end
end
