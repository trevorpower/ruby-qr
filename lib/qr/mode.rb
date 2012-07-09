module QR::Mode
  
  def data
    mode_bits(@mode) + super
  end

  def mode_bits mode
    case mode
      when :numeric then '0001'
      when :alphanumeric then '0010'
      when :byte then '0100'
      when :eom then '0000'
    end
  end

end
