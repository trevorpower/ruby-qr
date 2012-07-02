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
    def initialize(lower_level, config, mode)
      config[:data] = QR::Modes.send(mode) + config[:data] 
      super lower_level, config
    end
  end
end
