class QR::Invert < QR::Layer

  def initialize lower_level, config
    super lower_level
  end

  def module?(x, y, config)
    !super x, y, config
  end

end

