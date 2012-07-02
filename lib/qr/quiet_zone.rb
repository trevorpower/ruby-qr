class QR::QuietZone < QR::Layer

  def initialize (lower_layer, config, gap)
    @gap = gap
    super lower_layer
  end

  def max
    super + @gap * 2
  end

  def module?(x, y, config)
    return false if quiet_zone? x, y
    @next.module?(x - @gap, y - @gap, config)
  end

  def quiet_zone? x, y
    x < @gap || y < @gap || x > max - @gap || y > max - @gap
  end
end
