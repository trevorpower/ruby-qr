class QR::Invert < QR::Layer

  def initialize lower_level, config
    super lower_level
  end

  def module? *args
    ! super *args
  end

end

