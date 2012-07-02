class QR::Size < QR::Layer

  def initialize(lower_level, config, size)
    config[:max] = size - 1
    super lower_level
  end

end
