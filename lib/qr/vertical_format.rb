class QR::VerticalFormat < QR::Layer

  def initialize(n, o)
    super n, o
  end
  
  def module?(x, y, config)
    format_module?(x, y, config[:format]) do
      super x, y, config
    end
  end

  def format_module? x, y, format
    return yield if x != 8
    return true if max - y == 7
    if y < 8
      format[14 - y] == '1'
    elsif max - y < 7
      format[max - y] == '1'
    else
      yield
    end
  end

end
