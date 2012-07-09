module QR::FormatMask
  def format
    super
      .chars
      .map{|c| c.to_i}
      .zip('101010000010010'.chars.map{|c| c.to_i})
      .map{|a,b| a ^ b}
      .join
  end
end

