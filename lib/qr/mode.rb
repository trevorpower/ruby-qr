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
    def initialize(n, c, o)
      @mode = QR::Modes.send o
      super n, c
    end
    def configure config
      config[:data] = @mode + config[:data] 
    end
  end
end
