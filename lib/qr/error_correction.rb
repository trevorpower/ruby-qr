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

    def data
      super + ErrorCorrection.error_code(super)
    end

    def self.error_code data
      gf = [1]

      (1..255).map do |i|
        v = gf[i - 1] * 2
        v = v ^ 285 if v > 255
        gf[i] = v
      end

      poly = data
          .scan(%r/......../)
          .map{|i| i.to_i(2)}
          .map{|i| gf.index i}
      (0..9).each{ poly << nil }

      gen = [0, 251, 67, 46, 61, 118, 70, 64, 94, 32, 45]

      while poly.size >= gen.size
        diff = poly.first - gen.first
        poly = poly
          .zip(gen.map{|i| (i + diff) % 255})
          .map{|a,b| (a.nil? ? 0 : gf[a]) ^ (b.nil? ? 0 : gf[b])}
          .map{|i| gf.index i}
          .drop(1)
      end

      poly
        .map{|i| gf[i]}
        .map{|b| b.to_s 2}
        .map{|s| s.rjust 8, ?0}
        .join
    end

  end
end
