require 'qr/layer'

module QR
  class FormatMask < QR::Layer
    def mask
      '101010000010010'.chars.map{|c| c.to_i}
    end
    def configure config
      config[:format] =
        config[:format]
          .chars
          .map{|c| c.to_i}
          .zip(mask)
          .map{|a,b| a ^ b}
          .join
    end
  end
end
