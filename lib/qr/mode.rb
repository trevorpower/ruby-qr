class QR::Mode < QR::Layer
  
  def initialize(lower_level, config, mode)
    config[:data] = mode_bits(mode) + config[:data] 
    super lower_level, config
  end

  def mode_bits mode
    case mode
      when :numeric then '0001'
      when :alphanumeric then '0010'
      when :byte then '0100'
      when :eom then '0000'
    end
  end

end
