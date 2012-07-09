module QR::VerticalFormat
  def module? x, y, max
    if x != 8
      super
    elsif max - y == 7
      true
    elsif y < 8
      format[14 - y] == '1'
    elsif max - y < 7
      format[max - y] == '1'
    else
      super
    end
  end
end
