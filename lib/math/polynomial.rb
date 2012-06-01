module Math
  class Polynomial
    def self.div poly, denom
      quot = []

      while poly.size >= denom.size
        result = poly.first / denom.first
        quot[poly.size - denom.size] = result
        poly = poly
          .zip(denom)
          .map{|a,b| b.nil? ? a : a - b*result}
          .drop_while{|i| i == 0}
      end

      [quot.map{|i| i || 0}.reverse, poly]
    end
  end
end
