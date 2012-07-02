require 'qr/layer'

class QR::Padding < QR::Layer

  def initialize lower_layer, config
    config[:data] = pad config[:data]
    super lower_layer, config
  end
  
  def pad data
    data.ljust(8 * 19, '1110110000010001')
  end

end
