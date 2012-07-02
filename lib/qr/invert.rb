class QR::Invert < QR::Layer

  def initialize lower_level, config
    config[:module?] = proc {|*a| ! module? *a } 
    super lower_level
  end

end

