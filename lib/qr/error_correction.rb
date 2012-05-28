module QR
  class ErrorCorrection < Layer
    class Levels
      def self.L
        0b11
      end
      def self.M
        0b10
      end
      def self.Q
        0b01
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
      return super(i) unless i < 2
      @level[i]
    end
  end
end
