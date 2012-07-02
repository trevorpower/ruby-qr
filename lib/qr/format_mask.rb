require 'qr/layer'

module QR
  class FormatMask < QR::Layer

    def initialize lower_layer, config
      config[:format] = mask config[:format]
      super lower_layer
    end

    def mask format
      format 
        .chars
        .map{|c| c.to_i}
        .zip('101010000010010'.chars.map{|c| c.to_i})
        .map{|a,b| a ^ b}
        .join
    end
  end
end
