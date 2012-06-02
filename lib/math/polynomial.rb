module Math
  class Polynomial
    def self.div poly, denom
      poly = normalize poly
      denom = normalize denom

      puts poly.inspect
      puts denom.inspect

      quot = []

      while poly.size >= denom.size
        result = poly.first / denom.first
        quot[poly.size - denom.size] = result
        poly = poly
          .zip(denom)
          .map{|a,b| b.nil? ? a : a - b*result}
          .drop(1)
      end

      [quot.reverse.map{|i| i || 0}, normalize(poly)]
    end

    def self.normalize(poly)
      poly.drop_while{|i| i == 0}
    end
  end

end
