module QR::HorizontalFormat
  def module? x, y, max
    if y != 8
      super
    elsif x < 7
      format[x] == '1'
    elsif x == 7
      format[6] == '1'
    elsif max - x < 8
      format[x - max + 14] == '1'
    else
      super
    end
  end
end
