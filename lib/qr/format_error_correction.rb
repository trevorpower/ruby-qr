require 'qr/layer'
require 'math/polynomial'

module QR
  class FormatErrorCorrection < Layer

    def initialize lower_layer, config
      config[:format] = config[:format] + bch(config[:format])
      super lower_layer
    end

  end
end
