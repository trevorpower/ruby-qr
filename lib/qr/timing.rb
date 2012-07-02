require 'qr/layer'

module QR
  class Timing < Layer

    def initialize lower_layer, config
      super lower_layer
    end

    def module?(x, y, config)
      return y % 2 == 0 if x == 6
      return x % 2 == 0 if y == 6
      super x, y, config
    end

  end
end
