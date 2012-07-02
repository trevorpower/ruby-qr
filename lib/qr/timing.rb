require 'qr/layer'

module QR
  class Timing < Layer
    def module?(x, y, config)
      return y % 2 == 0 if x == 6
      return x % 2 == 0 if y == 6
      super x, y, config
    end
  end
end
