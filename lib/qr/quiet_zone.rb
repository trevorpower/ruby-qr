module QR::QuietZone
  def max
    super + quiet_zone_gap * 2
  end

  def module? x, y, max
    x >= quiet_zone_gap &&
    x <= max - quiet_zone_gap &&
    y >= quiet_zone_gap && 
    y <= max - quiet_zone_gap && 
    super(x - quiet_zone_gap, y - quiet_zone_gap, max - quiet_zone_gap * 2)
  end
end

