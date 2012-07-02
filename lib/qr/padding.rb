require 'qr/layer'

module QR
  class End < Layer
    def initialize lower_level, config
      config[:data] = config[:data] + "0000"
      super lower_level, config
    end
  end
end
