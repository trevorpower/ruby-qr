module QR::Mask

  def format
    super + "001"
  end

  def dark?(x, y, *a)
    super ^ (y % 2 == 0)
  end

end
