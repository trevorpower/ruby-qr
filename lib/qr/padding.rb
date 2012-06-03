require 'qr/layer'

module QR
  class End < Layer
    def data
      super + "0000"
    end
  end
end
