require 'qr/layer'

module QR
  class Length < Layer
    def configure config
      config[:data] = length(config[:data]) + config[:data]
    end

    def length(bits)
      bits.length.div(8).to_s(2).rjust(8, '0')
    end
  end
end
