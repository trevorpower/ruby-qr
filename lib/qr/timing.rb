module QR::Timing
  def data_column? x
    x != 6
  end
  def module? x, y, max
    return y % 2 == 0 if x == 6
    return x % 2 == 0 if y == 6
    super
  end
end

