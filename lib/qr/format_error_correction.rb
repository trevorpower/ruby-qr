require 'qr/layer'
require 'math/polynomial'

module QR
  class FormatErrorCorrection < Layer

    def format
      puts super + bch(super)
      super + bch(super)
    end

    def bch(bits)
      bits = bits.ljust 5, "0"
      poly = bits.chars.map{|c| c.to_i}
      poly.fill 0, 5, 10
      generator = [1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1]
      q, r = Math::Polynomial.div(poly, generator)
      r.map{|i| i*i}.join.rjust 10, "0"
    end

  end
end
