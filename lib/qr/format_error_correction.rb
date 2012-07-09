module QR::FormatErrorCorrection
  def format
    super + QR::Math.bch(super)
  end
end
