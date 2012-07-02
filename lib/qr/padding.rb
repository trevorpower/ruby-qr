require 'qr/layer'

class QR::End < QR::Layer
  
  def initialize lower_level, config
    config[:data] = config[:data] + "0000"
    super lower_level
  end

end
