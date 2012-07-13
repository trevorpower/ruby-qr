require 'math/polynomial'

module QR
  module Math
    def self.bch(bits)
      bits = bits.ljust 5, "0"
      poly = bits.chars.map{|c| c.to_i}
      poly.fill 0, 5, 10
      generator = [1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1]
      q, r = QR::Math::Polynomial.div(poly, generator)
      r.map{|i| i*i}.map{|i| i % 2}.join.rjust 10, "0"
    end
  end
end
  
