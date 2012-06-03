module QR
  class Modes
    def self.numeric
      '0001'
    end
    def self.alphanumeric
      '0010'
    end
    def self.byte
      '0100'
    end
    def self.eom
      '0000'
    end
  end
  class Mode < Layer
    def initialize(n, o)
      @mode = QR::Modes.send o
      @index = -1
      super n, o
    end
    def data
      @mode 
    end
    def module?(x, y)
      return super(x, y) unless @index < 3
      @index += 1 
      puts "#{x}, #{y}, #{@index}, #{@mode}"
      @mode[@index] == '1'
    end
  end
end
