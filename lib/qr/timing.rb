require 'qr/layer'

module QR
  class Timing < Layer
    def module?(x, y)
      return y % 2 == 0 if x == 6
      return x % 2 == 0 if y == 6
      super x, y
    end
  end
end
