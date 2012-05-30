require 'qr/layer'

module QR
  class ErrorCorrection < Layer
    class Levels
      def self.L
        0b01
      end
      def self.M
        0b00
      end
      def self.Q
        0b11
      end
      def self.H
        0b10
      end
    end
    def initialize n, o
      @level = Levels.send(o)
      super n, o
    end
    def format? i
      return super(i) unless i > 12
      @level[i - 13] == 1
    end
  end
end
