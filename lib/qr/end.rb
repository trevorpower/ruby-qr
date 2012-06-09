require 'qr/layer'

module QR
  class Padding < Layer
    def data
      super.ljust(8 * 19, '1110110000010001')
    end
  end
end
