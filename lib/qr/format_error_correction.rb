require 'math/bch'

module QR
  module FormatErrorCorrection
    def format
      super + QR::Math.bch(super)
    end
  end
end
