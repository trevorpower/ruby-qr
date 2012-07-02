class QR::QuietZone < QR::Layer

  def initialize (lower_layer, config, gap)
    config[:max] = config[:max] + gap * 2
    @gap = gap
    super lower_layer
  end

  def module?(x, y, max, config)
    return false if quiet_zone? x, y, max
    @next.module?(x - @gap, y - @gap, max - @gap * 2, config)
  end

  def quiet_zone? x, y, max
    x < @gap || y < @gap || x > max - @gap || y > max - @gap
  end
end
