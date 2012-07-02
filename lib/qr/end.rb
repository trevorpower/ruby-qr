require 'qr/layer'

class QR::Padding < QR::Layer

  def configure config
    config[:data] = pad config[:data]
  end
  
  def pad data
    data.ljust(8 * 19, '1110110000010001')
  end

end
