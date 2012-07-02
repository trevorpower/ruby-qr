require 'qr/layer'

module QR
  class Length < Layer

    def initialize lower_layer, config
      config[:data] = length(config[:data]) + config[:data]
      super lower_layer
    end

    def length(bits)
      bits.length.div(8).to_s(2).rjust(8, '0')
    end
  end
end
