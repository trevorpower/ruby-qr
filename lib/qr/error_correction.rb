require 'qr/layer'

module QR
  class ErrorCorrection < Layer
    class Levels
      def self.L
        '01'
      end
      def self.M
        '00'
      end
      def self.Q
        '11'
      end
      def self.H
        '10'
      end
    end
    def initialize n, o
      @level = Levels.send(o)
      super n, o
    end
    def format
      @level
    end
  end
end
