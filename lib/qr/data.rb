module QR::Data
  def module?(x, y, max)
    @index = -1 if @index.nil?
    @index += 1 
    data[@index] == '1'
  end
end
