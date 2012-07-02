require 'qr/layer'

module QR
  class ErrorCorrection < Layer

    def initialize lower_layer, config, level
      config[:data] = config[:data] + ErrorCorrection.error_code(config[:data])
      config[:format] = level_to_bits level
      super lower_layer, config
    end

    def level_to_bits level
      case level
        when :L then '01'
        when :M then '00'
        when :Q then '11'
        when :H then '10'
      end
    end

    def self.galois_field size, prime_modulus
      gf = [1]
      (1..size - 1).map do |i|
        v = gf[i - 1] * 2
        v = v ^ prime_modulus if v > size - 1
        gf[i] = v
      end
      gf
    end

    def self.generator_polynomial gf, size
      #[0, 251, 67, 46, 61, 118, 70, 64, 94, 32, 45]
      [0, 87, 229, 146, 149, 238, 102, 21]
    end

    def self.error_code data
      gf = galois_field 2**8, 0b100011101

      gen = generator_polynomial gf, 10

      poly = data
          .scan(%r/......../)
          .map{|i| i.to_i(2)}
          .map{|i| gf.index i}
          .concat(Array.new(7, nil))

      while poly.size >= gen.size
        diff = poly.first - gen.first
        poly = poly
          .zip(gen.map{|i| (i + diff) % 255})
          .map{|a,b| (a.nil? ? 0 : gf[a]) ^ (b.nil? ? 0 : gf[b])}
          .map{|i| gf.index i}
          .drop_while{|i| i.nil?}
      end

      poly
        .map{|i| gf[i]}
        .map{|b| b.to_s 2}
        .map{|s| s.rjust 8, ?0}
        .join
    end

  end
end
