require 'qr/layer'

module QR::Content

  def data
    @content
      .each_byte
      .map {|b| b.to_s(2).rjust(8, '0') }
      .join
  end

end
