class QR::Size < QR::Layer

  def initialize(lower_level, config, size)
    @max = size - 1
    super lower_level
  end

  def max
    @max
  end

end
