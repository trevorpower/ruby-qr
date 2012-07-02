require 'qr/layer'

class QR::Content < QR::Layer

  def initialize lower_layer, config, content
    super lower_layer, config
    config[:data] = bit_string content
  end

  def bit_string data
    data
      .each_byte
      .map {|b| b.to_s(2).rjust(8, '0') }
      .join
  end
end
