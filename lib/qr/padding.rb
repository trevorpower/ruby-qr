require 'qr/layer'

module QR
  class End < Layer
    def configure config
      config[:data] = config[:data] + "0000"
    end
  end
end
